select
	*
from
	sample_clinic_tb;
    
select
	0,
	treatment
from sample_clinic_tb
group by
	treatment
order by
	treatment;
    
select
	0,
	department
from
	sample_clinic_tb
group by
	department
order by
	department;
    
insert into doctor_tb
select
	0,
	doctor_name,
    department_id
from
	sample_clinic_tb sct
    inner join department_tb dt on(dt.department_name = sct.department)
group by
	department_id,
    doctor_name
order by
	department_id,
    doctor_name;
    
insert into patient_tb
select
	0,
	patient_name,
    gender,
    birth_date
from
	sample_clinic_tb sct
group by
	patient_name,
    gender,
    birth_date
order by
	patient_name;
    
insert into visit_tb
select
	0,
	pt.patient_id,
    doc.doctor_id,
    tt.treatment_id,
	sct.visit_date,
    sct.fee
from
	sample_clinic_tb sct
    inner join patient_tb pt on(pt.patient_name = sct.patient_name and pt.patient_birth_date = sct.birth_date)
    inner join department_tb dt on(dt.department_name = sct.department)
    inner join doctor_tb doc on(doc.doctor_name = sct.doctor_name and doc.department_id = dt.department_id)
    inner join treatment_tb tt on(tt.treatment_name = sct.treatment)
order by
	patient_id;



    
