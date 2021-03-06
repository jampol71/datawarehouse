/*20180104*/
USE STAGE;

SELECT 
COUNT(*) TOTAL_REGISTROS
, SUM(CASE WHEN LENGTH(TRIM(BILL_REF_NO))<>0 THEN 1 ELSE 0 END) TOTAL_BILL_REF_NO
, COUNT(DISTINCT CASE WHEN LENGTH(TRIM(BILL_REF_NO))<>0 THEN BILL_REF_NO ELSE 0 END) TOTAL_DISTINTOS_BILL_REF_NO
, SUM(CASE WHEN LENGTH(TRIM(CUSTOMER_ID))<>0 THEN 1 ELSE 0 END) TOTAL_CUSTOMER_ID
, COUNT(DISTINCT CASE WHEN LENGTH(TRIM(CUSTOMER_ID))<>0 THEN CUSTOMER_ID ELSE 0 END) TOTAL_DISTINTOS_CUSTOMER_ID
, SUM(CASE WHEN LENGTH(TRIM(BILL_CYCLE))<>0 THEN 1 ELSE 0 END) TOTAL_BILL_CYCLE
, COUNT(DISTINCT CASE WHEN LENGTH(TRIM(BILL_CYCLE))<>0 THEN BILL_CYCLE ELSE 0 END) TOTAL_DISTINTOS_BILL_CYCLE
, SUM(CASE WHEN LENGTH(TRIM(BILL_METHOD))<>0 THEN 1 ELSE 0 END) TOTAL_BILL_METHOD
, COUNT(DISTINCT CASE WHEN LENGTH(TRIM(BILL_METHOD))<>0 THEN BILL_METHOD ELSE 0 END) TOTAL_DISTINTOS_BILL_METHOD


FROM STAGE.STG_FACTURAS_FCT; 