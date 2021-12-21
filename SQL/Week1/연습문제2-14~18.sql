
-- 2-14. staff 테이블을 이용하여, staff의 picture 사진의 값이 있는 직원의 id, 이름, 성을 확인해주세요. 단 이름과 성을 하나의 컬럼으로 이름, 성의 형태로 새로운 컬럼 name 컬럼으로 도출해주세요.
-- ()는 없어도 성립
select staff_id , (first_name||', '||last_name) as name
from staff s 
where picture is not null

-- 2-15. rental 테이블을 이용하여, 대여는 했으나 아직 반납 기록이 없는 대여 건의 모든 정보를 확인해주세요.
select *
from rental r
where rental_date is not null and return_date is null

-- 2-16. address 테이블을 이용하여, postal_code 값이 빈 값(NULL)이거나 35200, 17886에 해당하는 address의 모든 정보를 확인해주세요.
-- postal_code는 문자열이다. 
select *
from address a 
where postal_code is null or postal_code in ('35200', '17886')
-- NULL은 없으나 공백(postal_code='') 존재 (2-12번) 
select *
from address a 
where postal_code in ('', '35200', '17886')

-- 2-17. 고객의 성에 John이라는 단어가 들어가는, 고객의 이름과 성을 모두 찾아주세요.
select first_name , last_name 
from customer c 
where last_name like '%John%'

-- 2-18. 주소 테이블에서, address2 값이 null 값인 row 전체를 확인해볼까요? (2-13번) 
-- NULL과 공백 모두 존재 
select *
from address a 
where address2 is null or address2 = ''

