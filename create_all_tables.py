import psycopg2
from tables import create_tables_sql

def get_db_connection(dbname, user, password, host='localhost', port='5432'):
    try:
        conn = psycopg2.connect(
            dbname=dbname,
            user=user,
            password=password,
            host=host,
            port=port
        )
        print(f"✅ Connected to '{dbname}'")
        return conn
    except Exception as e:
        print("❌ Connection failed:", e)
        return None

def create_all_tables(conn, table_sql_list):
    try:
        cursor = conn.cursor()
        for sql in table_sql_list:
            cursor.execute(sql)
        conn.commit()
        cursor.close()
        print("✅ All tables created successfully.")
    except Exception as e:
        print("❌ Error creating tables:", e)
