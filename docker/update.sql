/*
	UPDATE(데이터 수정)
    UPDATE 테이블명 SET 컬럼1 = 수정값, 컬럼2 = 수정값 WHERE 조건
*/

select * from student_tb;
select * from class_tb;
select * from class_register_tb;

update 
	class_tb ct
    -- left outer join class_register_tb crt on(crt.class_id = ct.class_id)
set
	class_name = 'JAVA 고급',
    price = 30000
where
	class_id = 1;