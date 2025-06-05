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
