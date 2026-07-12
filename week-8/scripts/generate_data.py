import pandas as pd
import random
import os

from faker import Faker
from datetime import datetime, timedelta

fake = Faker("en_IN")

random.seed(42)

RAW_DATA_PATH = "data/raw"

os.makedirs(RAW_DATA_PATH, exist_ok=True)

NUM_CUSTOMERS = 500
NUM_PRODUCTS = 500
NUM_ORDERS = 500
NUM_ORDER_ITEMS = 500 


def generate_customers():
    customers = []

    customer_types = ["REGULAR", "PREMIUM", "VIP"]

    for customer_id in range(1, NUM_CUSTOMERS + 1):

        name = fake.name()

        email = fake.email()

        # 2% Invalid Emails
        if random.random() < 0.02:
            email = email.replace("@", "")

        registration_date = fake.date_between(
            start_date="-3y",
            end_date="today"
        )

        customers.append({
            "customer_id": customer_id,
            "customer_name": name,
            "email": email,
            "registration_date": registration_date,
            "customer_type": random.choice(customer_types)
        })

    df = pd.DataFrame(customers)

    df.to_csv(
        os.path.join(RAW_DATA_PATH, "customers.csv"),
        index=False
    )

    print("✅ customers.csv generated")
    
def generate_products():
    products = []

    categories = {
        "Electronics": [
            "Laptop", "Mobile", "Headphones", "Mouse",
            "Keyboard", "Smart Watch", "Speaker"
        ],

        "Clothing": [
            "Shirt", "Jeans", "Jacket",
            "Shoes", "T-Shirt", "Kurta"
        ],

        "Home": [
            "Chair", "Table", "Sofa",
            "Lamp", "Curtains", "Fan"
        ],

        "Books": [
            "Novel", "Dictionary",
            "Biography", "Cookbook",
            "Science Book", "Comics"
        ]
    }

    for product_id in range(1, NUM_PRODUCTS + 1):

        category = random.choice(list(categories.keys()))

        product_name = random.choice(categories[category])

        # Mixed Case
        if random.random() < 0.20:
            product_name = product_name.upper()

        # Extra Spaces
        if random.random() < 0.20:
            product_name = "  " + product_name + "  "

        products.append({
            "product_id": product_id,
            "product_name": product_name,
            "category": category,
            "subcategory": product_name.strip(),
            "cost_price": round(random.uniform(100, 5000), 2)
        })

    df = pd.DataFrame(products)

    df.to_csv(
        os.path.join(RAW_DATA_PATH, "products.csv"),
        index=False
    )

    print("✅ products.csv generated")

def generate_orders():
    orders = []

    order_status = [
        "PLACED",
        "SHIPPED",
        "DELIVERED",
        "CANCELLED",
        "RETURNED"
    ]

    region_codes = [
        "NORTH",
        "SOUTH",
        "EAST",
        "WEST"
    ]

    for order_id in range(1, NUM_ORDERS + 1):

        # 5% NULL customer_id
        if random.random() < 0.05:
            customer_id = None
        else:
            customer_id = random.randint(1, NUM_CUSTOMERS)

        order_date = fake.date_time_between(
            start_date="-2y",
            end_date="now"
        )

        # Wrong Date Format
        if random.random() < 0.05:
            order_date = order_date.strftime("%d-%m-%Y")
        else:
            order_date = order_date.strftime("%Y-%m-%d %H:%M:%S")

        orders.append({
            "order_id": order_id,
            "customer_id": customer_id,
            "order_date": order_date,
            "status": random.choice(order_status),
            "region_code": random.choice(region_codes)
        })

    df = pd.DataFrame(orders)

    df.to_csv(
        os.path.join(RAW_DATA_PATH, "orders.csv"),
        index=False
    )

    print("✅ orders.csv generated")

def generate_orders():
    orders = []

    order_status = [
        "PLACED",
        "SHIPPED",
        "DELIVERED",
        "CANCELLED",
        "RETURNED"
    ]

    region_codes = [
        "NORTH",
        "SOUTH",
        "EAST",
        "WEST"
    ]

    for order_id in range(1, NUM_ORDERS + 1):

        # 5% NULL customer_id
        if random.random() < 0.05:
            customer_id = None
        else:
            customer_id = random.randint(1, NUM_CUSTOMERS)

        order_date = fake.date_time_between(
            start_date="-2y",
            end_date="now"
        )

        # Wrong Date Format
        if random.random() < 0.05:
            order_date = order_date.strftime("%d-%m-%Y")
        else:
            order_date = order_date.strftime("%Y-%m-%d %H:%M:%S")

        orders.append({
            "order_id": order_id,
            "customer_id": customer_id,
            "order_date": order_date,
            "status": random.choice(order_status),
            "region_code": random.choice(region_codes)
        })

    df = pd.DataFrame(orders)

    df.to_csv(
        os.path.join(RAW_DATA_PATH, "orders.csv"),
        index=False
    )

    print("✅ orders.csv generated")

def generate_order_items():
    order_items = []

    for item_id in range(1, NUM_ORDER_ITEMS + 1):

        order_id = random.randint(1, NUM_ORDERS)

        product_id = random.randint(1, NUM_PRODUCTS)

        quantity = random.randint(1, 5)

        # 3% Negative Quantity
        if random.random() < 0.03:
            quantity = -quantity

        unit_price = round(random.uniform(150, 6000), 2)

        discount_percent = random.randint(0, 100)

        order_items.append({
            "item_id": item_id,
            "order_id": order_id,
            "product_id": product_id,
            "quantity": quantity,
            "unit_price": unit_price,
            "discount_percent": discount_percent
        })

    df = pd.DataFrame(order_items)

    df.to_csv(
        os.path.join(RAW_DATA_PATH, "order_items.csv"),
        index=False
    )

    print("✅ order_items.csv generated")

if __name__ == "__main__":

    print("Generating datasets...\n")

    generate_customers()
    generate_products()
    generate_orders()
    generate_order_items()

    print("\n All CSV files generated successfully!")