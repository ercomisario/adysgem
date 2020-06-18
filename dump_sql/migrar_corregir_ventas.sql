SELECT * FROM `registers` WHERE id not in (
SELECT id FROM `registers_sede02` 
)
order by id asc

///////////////////////////////

INSERT INTO registers_sede02 
SELECT * FROM `registers` WHERE id not in (
SELECT id FROM `registers_sede02` 
)
order by id asc
///////////////////////////////////////////////////77

832312
832366

UPDATE sales set id_old=id WHERE invoice>832312
/////////////////////////////////////////////////////////////
UPDATE sales set invoice_old=invoice WHERE invoice>832312

UPDATE sales set invoice=(invoice+54) WHERE invoice_old>0

//////////////////////////////////////////////////////////////////

INSERT INTO `sales_sede02` (`id_old`, `invoice`, `client_id`, `clientname`, `tax`, `discount`, `subtotal`, `total`, `created_at`, `modified_at`, `status`, `created_by`, `totalitems`, `paid`, `paidmethod`, `taxamount`, `discountamount`, `register_id`, `firstpayement`, `in_activo`) 
SELECT
`id_old`, `invoice`, `client_id`, `clientname`, `tax`, `discount`, `subtotal`, `total`, `created_at`, `modified_at`, `status`, `created_by`, `totalitems`, `paid`, `paidmethod`, `taxamount`, `discountamount`, `register_id`, `firstpayement`, `in_activo`

FROM sales WHERE invoice_old>0 ORDER BY ID ASC

////////////////////////////////////////////////////////////

INSERT INTO `sale_items_sede02` (`sale_id`, `product_id`, `name`, `price`, `qt`, `subtotal`, `taxvalue`, `taxamount`, `discount`, `total`, `date`)

SELECT 
`sale_id`, `product_id`, `name`, `price`, `qt`, `subtotal`, `taxvalue`, `taxamount`, `discount`, `total`, `date`
FROM sale_items WHERE sale_id>674

////////////////////////////////////////////////7


UPDATE `sale_items_sede02` a, `sales_sede02` b
SET a.sale_id = b.id
WHERE a.sale_id = b.id_old AND b.id_old>0



