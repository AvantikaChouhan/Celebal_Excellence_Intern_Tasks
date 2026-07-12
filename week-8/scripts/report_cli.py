import sqlite3


DB_PATH = "database/ecommerce.db"


def connect_db():

    try:
        conn = sqlite3.connect(DB_PATH)
        return conn

    except sqlite3.Error as e:
        print(f"Database Connection Error: {e}")
        return None




def summary_report(conn, start_date, end_date):

    cursor = conn.cursor()

    query = """
    SELECT
        COUNT(DISTINCT o.order_id),

        ROUND(
            SUM(
                oi.quantity *
                oi.unit_price *
                (1 - oi.discount_percent/100.0)
            ),
            2
        ),

        COUNT(DISTINCT o.customer_id)

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE DATE(o.order_date)
    BETWEEN ? AND ?;
    """

    cursor.execute(query, (start_date, end_date))

    result = cursor.fetchone()

    if result is None or result[1] is None:
        return (0, 0.0, 0)

    return result

def top_products(conn, start_date, end_date):

    cursor = conn.cursor()

    query = """
    SELECT

        p.product_name,

        SUM(oi.quantity) AS total_quantity

    FROM products p

    JOIN order_items oi
        ON p.product_id = oi.product_id

    JOIN orders o
        ON oi.order_id = o.order_id

    WHERE DATE(o.order_date)
    BETWEEN ? AND ?

    GROUP BY p.product_name

    ORDER BY total_quantity DESC

    LIMIT 3;
    """

    cursor.execute(query, (start_date, end_date))

    return cursor.fetchall()


def previous_period_revenue(conn, start_date):

    cursor = conn.cursor()

    query = """
    SELECT

        ROUND(
            SUM(
                oi.quantity *
                oi.unit_price *
                (1 - oi.discount_percent/100.0)
            ),
            2
        )

    FROM orders o

    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE DATE(o.order_date) < ?;
    """

    cursor.execute(query, (start_date,))

    result = cursor.fetchone()

    if result[0] is None:
        return 0

    return result[0]

def available_date_range(conn):

    cursor = conn.cursor()

    query = """
    SELECT
        MIN(DATE(order_date)),
        MAX(DATE(order_date))
    FROM orders;
    """

    cursor.execute(query)

    return cursor.fetchone()


def main():

    print("===== E-Commerce Analytics Report =====")

    report_type = input(
        "Enter Report Type (daily/weekly/monthly): "
    ).strip().lower()

    start_date = input(
        "Enter Start Date (YYYY-MM-DD): "
    ).strip()

    end_date = input(
        "Enter End Date (YYYY-MM-DD): "
    ).strip()

    if report_type not in ["daily", "weekly", "monthly"]:

        print("Invalid Report Type!")
        return

    conn = connect_db()

    if conn is None:
        return

    print("\nDatabase Connected Successfully!")

    # Show available date range
    available_dates = available_date_range(conn)

    print("\nAvailable Data Range")
    print(f"From : {available_dates[0]}")
    print(f"To   : {available_dates[1]}")

    # Check if entered dates are outside available range
    if start_date < available_dates[0] or end_date > available_dates[1]:

        print("\nSelected date range is outside the available data.")
        print(f"Please enter dates between {available_dates[0]} and {available_dates[1]}")

        conn.close()
        return

    # Summary
    summary = summary_report(
        conn,
        start_date,
        end_date
    )

    if summary[0] == 0:

        print("\nNo data found for the selected date range.")

        conn.close()
        return

    print("\n===== Summary =====")

    print(f"Total Orders      : {summary[0]}")
    print(f"Total Revenue     : {summary[1]}")
    print(f"Unique Customers  : {summary[2]}")

    # Top Products
    top3 = top_products(
        conn,
        start_date,
        end_date
    )

    print("\n===== Top 3 Products =====")

    if len(top3) == 0:

        print("No products found.")

    else:

        for i, product in enumerate(top3, start=1):

            print(f"{i}. {product[0]} - Quantity Sold: {product[1]}")

    # Revenue Comparison
    current_revenue = summary[1]

    previous_revenue = previous_period_revenue(
        conn,
        start_date
    )

    print("\n===== Revenue Comparison =====")

    print(f"Current Revenue  : {current_revenue}")
    print(f"Previous Revenue : {previous_revenue}")

    if previous_revenue == 0:

        print("Percentage Change : N/A")

    else:

        change = (
            (current_revenue - previous_revenue)
            / previous_revenue
        ) * 100

        print(f"Percentage Change : {change:.2f}%")

    conn.close()


if __name__ == "__main__":

    main()