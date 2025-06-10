import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
def standardize_column_names(df):
    """
    Standardizes column names in a pandas DataFrame:
    - Strips whitespace
    - Converts to lowercase
    - Replaces non-alphanumeric characters with underscores
    - Removes multiple underscores
    - Removes leading/trailing underscores
    """
    df.columns = (
        df.columns.str.strip()                                 # Remove leading/trailing spaces
                  .str.lower()                                 # Convert to lowercase
                  .str.replace(r'[^\w\s]', '_', regex=True)    # Replace special chars with _
                  .str.replace(r'\s+', '_', regex=True)        # Replace spaces with _
                  .str.replace(r'_+', '_', regex=True)         # Remove multiple underscores
                  .str.strip('_')                              # Remove leading/trailing _
    )
    return df
def create_database(db_params):
    """
    Creates a PostgreSQL database if it does not already exist.
    """
    host, user, password, db_name = db_params

    # Connect to default 'postgres' database
    conn = psycopg2.connect(host=host, user=user, password=password, dbname='postgres')
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    cur = conn.cursor()

    # Check if the database exists
    cur.execute("SELECT 1 FROM pg_database WHERE datname = %s", (db_name,))
    exists = cur.fetchone()

    if exists:
        print(f"✅ Database '{db_name}' already exists.")
    else:
        cur.execute(f"CREATE DATABASE {db_name}")
        print(f"🎉 Database '{db_name}' created successfully.")

    cur.close()
    conn.close()

def upsert_df_data(conn, df, table_name, conflict_columns, update_columns=None, schema='public'):
    """
    Upserts a DataFrame into a PostgreSQL table with debug status output.

    Parameters:
    - conn: psycopg2 connection object
    - df: pandas DataFrame to upsert
    - table_name: name of the target table
    - conflict_columns: list of columns to use for ON CONFLICT clause
    - update_columns: list of columns to update on conflict; if None, all except conflict_columns
    - schema: database schema (default is 'public')
    """
    if df is None or df.empty:
        print(f"Skipping {schema}.{table_name}: DataFrame is empty or None.")
        return

    print(f"Preparing to upsert {len(df)} rows into {schema}.{table_name}...")

    if update_columns is None:
        update_columns = [col for col in df.columns if col not in conflict_columns]

    columns = list(df.columns)
    values = [tuple(x) for x in df.to_numpy()]
    placeholders = ', '.join(['%s'] * len(columns))
    conflict_cols = ', '.join(conflict_columns)
    update_stmt = ', '.join([f"{col} = EXCLUDED.{col}" for col in update_columns])

    insert_sql = (f"INSERT INTO {schema}.{table_name} ({', '.join(columns)}) "
                  f"VALUES ({placeholders}) "
                  f"ON CONFLICT ({conflict_cols}) DO UPDATE SET {update_stmt}\n")

    with conn.cursor() as cur:
        cur.executemany(insert_sql, values)
        conn.commit()
