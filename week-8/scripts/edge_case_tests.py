import sqlite3

DB_PATH = "database/ecommerce.db"


def connect_db():

    return sqlite3.connect(DB_PATH)

def test_invalid_order_id():

    conn = connect_db()

    cursor = conn.cursor()

    cursor.execute("""

        SELECT item_id, order_id

        FROM order_items

        WHERE order_id NOT IN (

            SELECT order_id

            FROM orders

        );

    """)

    rows = cursor.fetchall()

    print("\n===== Test 1 : Invalid Order ID =====")

    if rows:

        print(f"Found {len(rows)} invalid records.")

    else:

        print("PASS - No invalid order_id found.")

    conn.close()
def test_discount_over_100():

    conn = connect_db()

    cursor = conn.cursor()

    cursor.execute("""

        SELECT
            item_id,
            discount_percent

        FROM order_items

        WHERE discount_percent > 100;

    """)

    rows = cursor.fetchall()

    print("\n===== Test 2 : Discount > 100 =====")

    if rows:

        print(f"FAIL - Found {len(rows)} invalid discount records.")

    else:

        print("PASS - All discount values are valid.")

    conn.close()
def test_zero_quantity():

    conn = connect_db()

    cursor = conn.cursor()

    cursor.execute("""

        SELECT
            item_id,
            quantity

        FROM order_items

        WHERE quantity = 0;

    """)

    rows = cursor.fetchall()

    print("\n===== Test 3 : Zero Quantity =====")

    if rows:

        print(f"FAIL - Found {len(rows)} records with zero quantity.")

    else:

        print("PASS - No zero quantity records found.")

    conn.close()
def test_future_order_date():

    conn = connect_db()

    cursor = conn.cursor()

    cursor.execute("""

        SELECT
            order_id,
            order_date

        FROM orders

        WHERE DATE(order_date) > DATE('now');

    """)

    rows = cursor.fetchall()

    print("\n===== Test 4 : Future Order Date =====")

    if rows:

        print(f"FAIL - Found {len(rows)} future orders.")

    else:

        print("PASS - No future order dates found.")

    conn.close()

if __name__ == "__main__":

    test_invalid_order_id()

    test_discount_over_100()

    test_zero_quantity()

    test_future_order_date()