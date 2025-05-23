/*
	조건 연산자 
    or => in()
    and => between A and B
    is null
    in not null
*/

select
	*
from 
	product_tb
where
	price > 500000
    and stock > 400;
    
select
	*
from
	product_tb
where
	brand_id in (select brand_id from brand_tb where brand_name in('LG', '다이소'));
    

select 
	*
from
	product_tb
where
	price >= 100000
    and price <= 200000;
    
select 
	*
from
	product_tb
where
	price between 100000 and 200000;
    
select
	*
from
	(select 
		product_name,
		stock,
		if(stock = 0, '부족', null) as stock_status
	from 
		product_tb) as tpt
where
	stock_status is not null;
    
/*
	like 연산자(와일드카드 %, _)
    % -> 글자수 상관없이 앞뒤중간 사용
    _ -> 글자수가 정해져있다면 ?
*/
    
select
	*
from
	product_tb
where
	-- product_name like '강력한%';
	-- product_name like '%노트북';
    -- product_name like '%한%상';
    product_name like '____책상';
    
select 
	*
from 
	supplier_tb
where 
	supplier_name like '%김' 
    or supplier_name like '%이';

select
	*
from
	supplier_tb
where
	supplier_name in('양김', '이김');




