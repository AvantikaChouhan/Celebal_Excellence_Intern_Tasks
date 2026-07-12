import pandas as pd
import os

RAW_DATA_PATH = "data/raw"
CLEAN_DATA_PATH = "data/cleaned"

os.makedirs(CLEAN_DATA_PATH, exist_ok=True)

def load_data():

    customers = pd.read_csv(
        os.path.join(RAW_DATA_PATH, "customers.csv")
    )

    products = pd.read_csv(
        os.path.join(RAW_DATA_PATH, "products.csv")
    )

    orders = pd.read_csv(
        os.path.join(RAW_DATA_PATH, "orders.csv")
    )

    order_items = pd.read_csv(
        os.path.join(RAW_DATA_PATH, "order_items.csv")
    )

    return customers, products, orders, order_items

def clean_orders(orders):

    print("\nCleaning Orders...")

    # Remove duplicate rows
    orders = orders.drop_duplicates()

    # Convert customer_id to numeric
    orders["customer_id"] = pd.to_numeric(
        orders["customer_id"],
        errors="coerce"
    )

    # Fill missing customer_id with 0
    orders["customer_id"] = orders["customer_id"].fillna(0).astype(int)

    # Fix different date formats
    orders["order_date"] = pd.to_datetime(
        orders["order_date"],
        format="mixed",
        dayfirst=True,
        errors="coerce"
    )

    # Remove rows where date couldn't be parsed
    orders = orders.dropna(subset=["order_date"])

    print("Orders cleaned successfully.")

    return orders

def clean_products(products):

    print("\nCleaning Products...")

    # Remove duplicate rows
    products = products.drop_duplicates()

    # Remove extra spaces
    products["product_name"] = products["product_name"].str.strip()

    # Convert to Title Case
    products["product_name"] = products["product_name"].str.title()

    print("Products cleaned successfully.")

    return products

def validate_emails(customers):

    print("\nValidating Emails...")

    invalid_emails = customers[
        ~customers["email"].str.contains("@", na=False)
    ]

    print(f"Invalid Emails Found: {len(invalid_emails)}")

    return invalid_emails

def check_referential_integrity(orders, order_items):

    print("\nChecking Referential Integrity...")

    invalid_orders = order_items[
        ~order_items["order_id"].isin(orders["order_id"])
    ]

    print(f"Invalid Order References Found: {len(invalid_orders)}")

    return invalid_orders

if __name__ == "__main__":

    customers, products, orders, order_items = load_data()

    orders = clean_orders(orders)

    products = clean_products(products)

    invalid_emails = validate_emails(customers)

    invalid_orders = check_referential_integrity(
        orders,
        order_items
    )

    customers.to_csv(
        os.path.join(CLEAN_DATA_PATH, "customers_clean.csv"),
        index=False
    )

    products.to_csv(
        os.path.join(CLEAN_DATA_PATH, "products_clean.csv"),
        index=False
    )

    orders.to_csv(
        os.path.join(CLEAN_DATA_PATH, "orders_clean.csv"),
        index=False
    )

    order_items.to_csv(
        os.path.join(CLEAN_DATA_PATH, "order_items_clean.csv"),
        index=False
    )

    print("\n✅ All cleaned files saved successfully.")
