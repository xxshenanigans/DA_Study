
-- 2-6. address 테이블을 이용하여, 우편번호(postal_code) 값이 77로 시작하는 주소에 대하여, address_id, address, district, postal_code 컬럼을 확인해주세요.
select address_id , address , district , postal_code 
from address a 
where postal_code like '77%'

-- 2-7. address 테이블을 이용하여, 우편번호(postal_code) 값이 두 번째 글자가 1인 우편번호의 address_id, address, district, postal_code 컬럼을 확인해주세요.
select address_id , address , district , postal_code 
from address a 
where substring(postal_code, 2, 1) = '1'

-- 2-8. payment 테이블을 이용하여, 고객번호가 341에 해당하는 사람이 결제를 2007년 2월 15~16일 사이에 한 모든 결제 내역을 확인해주세요.
select *
from payment p 
where customer_id = 341 and date(payment_date) between '2007-02-15' and '2007-02-16'
-- 다음과 같이 날짜를 나타낼 수도 있다.
select *
from payment p 
where customer_id = 341 and payment_date between '2007-02-15 00:00:00' and '2007-02-16 23:59:59'

-- 2-9. payment 테이블을 이용하여, 고객번호가 355에 해당하는 사람의 결제 금액이 1~3원 사이에 해당하는 모든 결제 내역을 확인해주세요.
select *
from payment p 
where customer_id = 355 and amount between 1 and 3

-- 2-10. customer 테이블을 이용하여, 고객의 이름이 Maria, Lisa, Mike에 해당하는 사람의 id, 이름, 성을 확인해주세요.
select customer_id , first_name , last_name 
from customer c 
where first_name in ('Maria', 'Lisa', 'Mike')

-- 2-11. film 테이블을 이용하여, film의 길이가 100~120에 해당하거나 또는 rental 대여 기간이 3~5일에 해당하는 film의 모든 정보를 확인해주세요.
select *
from film f  
where (length between 100 and 120) or (rental_duration between 3 and 5)

-- 2-12. address 테이블을 이용하여, postal_code 값이 공백('')이거나 35200, 17886에 해당하는 address에 모든 정보를 확인해주세요.
select *
from address a 
where postal_code in ('', '35200', '17886')
-- case문 사용 
select *,
    case when a.postal_code = '' then 'empty'
    else cast(postal_code as varchar)
    end as postal_code_emptyflag
from address a 
where a.postal_code in ('', '35200', '17886')

-- 2-13. address 테이블을 이용하여, address의 상세주소(=address2) 값이 존재하지 않는 모든 데이터를 확인하여 주세요.
select *
from address a 
where address2 is null
-- coalesce() 사용 
select *,
coalesce (address2, 'empty') as new_address2
from address a 
where address2 is null

