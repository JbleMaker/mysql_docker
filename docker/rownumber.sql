/*
	row_number
    -> over()와 같이 사용
    -> over(order by ~)
    partition by 
    -> 그룹별로 묶어서 번호를 체크할 수 있다.
    
    rank
    -> 순위 
*/

select
	*
from
	(select
		row_number() over(partition by bt.brand_id order by bt.brand_id, max(pt.price) desc) as `number`,
		bt.brand_id,
		bt.brand_name,
		pt.product_name,
		max(pt.price) max_price,
        min(pt.price) min_price
	from
		brand_tb bt
		inner join product_tb pt on(pt.brand_id = bt.brand_id)
	group by
		brand_id,
		pt.product_name) tbt
where
	tbt.number < 6;
    
    
/* 
	rank
*/
    
select
	*
from
	(select
		row_number() over(partition by bt.brand_id order by bt.brand_id, max(pt.price) desc) as `number`,
		bt.brand_id,
		bt.brand_name,
		pt.product_name,
		max(pt.price) max_price,
        min(pt.price) min_price
	from
		brand_tb bt
		inner join product_tb pt on(pt.brand_id = bt.brand_id)
	group by
		brand_id,
		pt.product_name) tbt
where
	tbt.number < 6;

select 
	product_name,
    stock,
    count(*)
from
	product_tb
group by
	product_name,
    stock
having
	count(*) > 2;
    
select
	dense_rank() over(partition by bt.brand_id order by bt.brand_id, max(stock)) as `rank`,
	bt.brand_name,
	product_name,
	max(stock) as max_stock
from
	brand_tb bt
	left outer join product_tb pt on(pt.brand_id = bt.brand_id)
group by
	bt.brand_id,
	product_name;
    
select
	*
from
	(select
		dense_rank() over(partition by bt.brand_id order by bt.brand_id, max(stock)) as `rank`,
		bt.brand_name,
		product_name,
		max(stock) as max_stock
	from
		brand_tb bt
		left outer join product_tb pt on(pt.brand_id = bt.brand_id)
	group by
		bt.brand_id,
		product_name) tbt
where
	tbt.rank < 6;
    