import pandas as pd

def transform_fact_sales(data):
    orders = data["orders"]
    order_items = data["order_items"]
    products = data["products"]

    fact_sales = order_items.merge(
        orders[["order_id", "customer_id", "order_created_at"]],
        on="order_id",
        how="left"
    ).merge(
        products[["product_id", "product_name"]],
        on="product_id",
        how="left"
    )

    if "unit_price" in fact_sales.columns:
        fact_sales["revenue"] = fact_sales["quantity"] * fact_sales["unit_price"]
    else:
        fact_sales["revenue"] = None

    return fact_sales

def transform_monthly_revenue(data):
    orders = data["orders"].copy()
    orders["month"] = pd.to_datetime(orders["order_created_at"]).dt.to_period("M").astype(str)

    monthly_revenue = (
        orders.groupby("month", as_index=False)["order_total"]
        .sum()
        .rename(columns={"order_total": "revenue"})
        .sort_values("month")
    )

    return monthly_revenue

def transform_inventory_risk(data):
    inventory = data["inventory"]
    products = data["products"]
    warehouses = data["warehouses"]

    inventory_risk = inventory.merge(
        products[["product_id", "product_name"]],
        on="product_id",
        how="left"
    ).merge(
        warehouses[["warehouse_id", "warehouse_name", "state"]],
        on="warehouse_id",
        how="left"
    )

    inventory_risk = inventory_risk[
        inventory_risk["stock_quantity"] < inventory_risk["reorder_lvl"]
    ].sort_values("stock_quantity")

    return inventory_risk

def run_transformations(data):
    transformed_data = {
        "fact_sales": transform_fact_sales(data),
        "monthly_revenue": transform_monthly_revenue(data),
        "inventory_risk": transform_inventory_risk(data)
    }

    for name, df in transformed_data.items():
        print(f"Transformed {name}: {len(df)} rows")

    return transformed_data