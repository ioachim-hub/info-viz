-- infoviz.OnlineShopping definition
CREATE TABLE infoviz.OnlineShopping (
  CustomerID float,
  Gender varchar(50),
  Location varchar(50),
  Tenure_Months float,
  Transaction_ID float,
  Transaction_Date date,
  Product_SKU varchar(50),
  Product_Description varchar(64),
  Product_Category varchar(50),
  Quantity float,
  Avg_Price float,
  Delivery_Charges float,
  Coupon_Status varchar(50),
  GST float,
  Date date,
  Offline_Spend float,
  Online_Spend float,
  Month int,
  Coupon_Code varchar(50),
  Discount_pct float,
  "Location-ISO" varchar(50),
  Lat float,
  Long float
);

CREATE PROJECTION infoviz.OnlineShopping_super
/*+basename(OnlineShopping),createtype(L)*/
(
  CustomerID,
  Gender,
  Location,
  Tenure_Months,
  Transaction_ID,
  Transaction_Date,
  Product_SKU,
  Product_Description,
  Product_Category,
  Quantity,
  Avg_Price,
  Delivery_Charges,
  Coupon_Status,
  GST,
  Date,
  Offline_Spend,
  Online_Spend,
  Month,
  Coupon_Code,
  Discount_pct,
  "Location-ISO",
  Lat,
  Long
) AS
SELECT
  OnlineShopping.CustomerID,
  OnlineShopping.Gender,
  OnlineShopping.Location,
  OnlineShopping.Tenure_Months,
  OnlineShopping.Transaction_ID,
  OnlineShopping.Transaction_Date,
  OnlineShopping.Product_SKU,
  OnlineShopping.Product_Description,
  OnlineShopping.Product_Category,
  OnlineShopping.Quantity,
  OnlineShopping.Avg_Price,
  OnlineShopping.Delivery_Charges,
  OnlineShopping.Coupon_Status,
  OnlineShopping.GST,
  OnlineShopping.Date,
  OnlineShopping.Offline_Spend,
  OnlineShopping.Online_Spend,
  OnlineShopping.Month,
  OnlineShopping.Coupon_Code,
  OnlineShopping.Discount_pct,
  OnlineShopping."Location-ISO",
  OnlineShopping.Lat,
  OnlineShopping.Long
FROM
  infoviz.OnlineShopping
ORDER BY
  OnlineShopping.CustomerID,
  OnlineShopping.Gender,
  OnlineShopping.Location,
  OnlineShopping.Tenure_Months,
  OnlineShopping.Transaction_ID,
  OnlineShopping.Transaction_Date,
  OnlineShopping.Product_SKU,
  OnlineShopping.Product_Description SEGMENTED BY hash(
    OnlineShopping.CustomerID,
    OnlineShopping.Tenure_Months,
    OnlineShopping.Transaction_ID,
    OnlineShopping.Transaction_Date,
    OnlineShopping.Quantity,
    OnlineShopping.Avg_Price,
    OnlineShopping.Delivery_Charges,
    OnlineShopping.GST
  ) ALL NODES OFFSET 0;

SELECT
  MARK_DESIGN_KSAFE(0);