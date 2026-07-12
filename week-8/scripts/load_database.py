import sqlite3
import pandas as pd
import os

DATABASE_PATH = "database/ecommerce.db"

SCHEMA_PATH = "sql/schema.sql"

CLEAN_DATA_PATH = "data/cleaned"

def create_connection():

    connection = sqlite3.connect(DATABASE_PATH)

    print("Database Connected Successfully.")

    return connection

def execute_schema(connection):

    with open(SCHEMA_PATH, "r") as file:
        schema = file.read()

    cursor = connection.cursor()

    cursor.executescript(schema)

    connection.commit()

    print("Database Tables Created Successfully.")

def load_data_to_database(connection):

    customers = pd.read_csv(
        os.path.join(CLEAN_DATA_PATH, "customers_clean.csv")
    )

    products = pd.read_csv(
        os.path.join(CLEAN_DATA_PATH, "products_clean.csv")
    )

    orders = pd.read_csv(
        os.path.join(CLEAN_DATA_PATH, "orders_clean.csv")
    )

    order_items = pd.read_csv(
        os.path.join(CLEAN_DATA_PATH, "order_items_clean.csv")
    )

    customers.to_sql(
        "customers",
        connection,
        if_exists="append",
        index=False
    )

    products.to_sql(
        "products",
        connection,
        if_exists="append",
        index=False
    )

    orders.to_sql(
        "orders",
        connection,
        if_exists="append",
        index=False
    )

    order_items.to_sql(
        "order_items",
        connection,
        if_exists="append",
        index=False
    )

    print("Data Loaded Successfully.")

def verify_data(connection):

    cursor = connection.cursor()

    tables = [
        "customers",
        "products",
        "orders",
        "order_items"
    ]

    print("\nRow Counts:")

    for table in tables:

        cursor.execute(
            f"SELECT COUNT(*) FROM {table}"
        )

        count = cursor.fetchone()[0]

        print(f"{table}: {count}")

if __name__ == "__main__":

    connection = create_connection()

    execute_schema(connection)

    load_data_to_database(connection)

    verify_data(connection)

    connection.close()

    print("\nDatabase Created Successfully.")