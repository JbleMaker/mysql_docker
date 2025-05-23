/*
	SELECT(데이터 조회)
	SELECT 컬럼1, 컬럼2 FROM 데이블명;
*/

select student_name as sn, student_age, student_age as age from student_tb where student_age > 25;
select 10 as number;
select 10 + 20 as number2;
select * from (select 10+20 as number2, 40 as number3) as n_tb;

/*
	select 결과들을 합치는 방법(union(중복제거), union all)
    제약 조건
    1. 컬럼의 개수가 일치해야 한다.
    2. 테이블을 select한 결과를 합치려면 자료형도 일치해야한다.
*/

select 30, 40 union select 50, 60 union select 70, 80;

select 10, 20 union all select 10, 20;   

select * from class_tb union select * from student_tb;

/*
	join(테이블 합치기)
	SELECT * FROM 테이블1 JOIN 테이블2;
        
*/

select * from student_tb as st1 join student_tb as st2;

select * from 
student_tb st1 
left outer join
student_tb st2 on(st2.student_id = st1.student_id + 1)
left outer join 
student_tb st3 on(st3.student_id = st2.student_id + 1);

select
	* 
from 
	student_tb st1 
	inner join student_tb st2 on(st2.student_id = st1.student_id + 1)
	left outer join student_tb st3 on(st3.student_id = st2.student_id + 1);

insert into class_register_tb
values
	(default, 1, 2),
    (default, 1, 3),
    (default, 1, 4),
    (default, 2, 2),
    (default, 2, 5),
    (default, 2, 8),
    (default, 2, 7),
    (default, 2, 9);

/*
	서브쿼리(하위 쿼리)
*/

select
	*
from
	class_register_tb as rt
    inner join student_tb as st on(st.student_id = rt.student_id)
    inner join class_tb as ct on(ct.class_id = rt.class_id)
    where rt.student_id = 1;
    
explain analyze select
	crt.class_register_id,
    crt.class_id,
    ct.class_name,
    crt.student_id,
    st.student_name	
from 
	class_register_tb crt
    left outer join class_tb ct on(ct.class_id = crt.class_id)
    left outer join student_tb st on(st.student_id = crt.student_id)
where
	st.student_name = '이서연';

select
	crt.class_id,
    (select class_name from class_tb ct where ct.class_id = crt.class_id) as class_name
from 
	class_register_tb crt
where
	student_id = (	select
						student_id
					from
						student_tb
					where
						student_name = '이서연');

/*
	쿼리 성능 비교
    join은 응답시간이 많이 걸림
    그에 비해 상대적으로 서브쿼리의 경우 응답시간이 적게 걸린다.
*/
set profiling = 1;
/*쿼리 실행*/
explain analyze select * from student_tb;
explain analyze select * from class_tb;

select
	crt.class_register_id,
    (select class_name from class_tb ct where ct.class_id = crt.class_id) as class_name,
    (select student_id from student_tb st where st.student_id = crt.student_id) as student_id,
    (select student_name from student_tb st where st.student_id = crt.student_id) as student_name
from
	class_register_tb crt
where class_id = (select 
						class_id
					from
						class_tb
					where 
						price = 200000)
order by student_id asc;


