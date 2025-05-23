select * from sample_products_tb;
/*
	정규화(중복제거) -> normalization
    중복제거 방법
    1. distinct(행의 조합 데이터가 동일한 행을 제거해준다.)
    2. group by(select절과 상관없이 group by절에서 컬럼을 선택하여 중복을 제거한다.)
    
    select 실행 순서(해석 순서)
    1. from	 	-> 데이터가 존재하는 테이블을 조회하거나 조인을 하는 역할.
    2. on 		-> 조인이 있는 경우, 조인 조건을 평가.
    3. join 	-> on 조건에 해당하는 데이터를 결합하는 역할.
    4. where 	-> from에서 조회할 데이터의 조건을 평가.
    5. group by -> 조회된 결과에서 명시된 컬럼끼리 그룹핑을 하는 역할.
    6. having 	-> 그룹핑된 결과에서 데이터의 조건을 평가.
    7. select 	-> 최종 출력할 컬럼을 선택하는 역할.
    8. disticnt -> select에서 선택한 컬럼의 조합결과에서 중복행 제거.
    9. order by -> 최종 select 결과를 오름차순(ASC) 또는 내림차순(DESC)으로 정렬.
    10. limit	-> 최종 select 결과의 행 개수를 제한할 수 있다.
*/
select
	distinct
	category_name
from 
	sample_products_tb
order by 
	category_name;
    
insert into category_tb(category_name)
select 
	category_name
from
	sample_products_tb
group by 
	category_name
order by
	category_name;
    
insert into brand_tb(brand_name)
select
	brand_name
from 
	sample_products_tb
group by
	brand_name
order by
	brand_name;
    

select 
	distinct
	supplier_name,
    supplier_phone
from
	sample_products_tb;
    
    
select
	supplier_name,
	supplier_phone
from
	sample_products_tb
group by
	supplier_name,
	supplier_phone
order by
	supplier_name;
    
    
insert into product_tb
select 
	0,
	spt.product_name, 
    ct.category_id,
    bt.brand_id,
    st.supplier_id,
    spt.price,
    spt.stock_quantity
from
	sample_products_tb spt
    inner join category_tb ct on(ct.category_name = spt.category_name)
    inner join brand_tb bt on(bt.brand_name = spt.brand_name)
    inner join supplier_tb st on(st.supplier_name = spt.supplier_name and st.supplier_phone = spt.supplier_phone)
order by
	product_name,
    category_id,
    brand_id,
    supplier_id;
























