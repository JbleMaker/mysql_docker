select 
	student_name as sn,
    student_age as age
from student_tb
where student_age > 25;

select * from class_register_tb;

select * from student_tb st1 join student_tb st2 
where st1.student_id = st2.student_id
order by st1.student_id asc;

select
	crt.register_id,
    ct.class_name,
    st.student_id,
    st.student_name
from 
	class_register_tb crt 
	inner join student_tb st on(st.student_id = crt.student_id)
    inner join class_tb ct on(ct.class_id = crt.class_id)
where ct.class_price = 200000
order by st.student_id asc;



select
	crt.register_id,
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
						class_price = 200000)
order by student_id asc;


select 
	crt.register_id,
    ct.class_name,
    st.student_name
from 
	class_register_tb crt
	left outer join class_tb ct on(ct.class_id = crt.class_id)
    left outer join student_tb st on(st.student_id = crt.student_id)
where 
	st.student_name = '이서연';

select
	crt.register_id,
    (select class_name from class_tb ct where ct.class_id = crt.class_id) as class_name,
    (select student_name from student_tb st where st.student_id = crt.student_id) as student_name
from
	class_register_tb crt
where student_id = (select 
						student_id
					from
						student_tb
					where student_name = '이서연');
	
