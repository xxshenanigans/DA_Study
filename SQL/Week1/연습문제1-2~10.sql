-- 1-2. 영화길이가 120분 이상이면서, 대여기간이 4일 이상이 가능한, 영화제목을 알려주세요.
select title
from film f 
where length >= 120 and rental_duration >= 4

-- 1-3. 직원의 id가 2번인 직원의 id, 이름, 성을 알려주세요.
select staff_id, first_name, last_name
from staff s 
where staff_id = 2

-- 1-4. 지불 내역 중에서, 지불 내역 번호가 17510에 해당하는 고객의 지출 내역(amount)은 얼마인가요?
select amount
from payment p 
where payment_id = 17510

-- 1-5. 영화 카테고리 중에서, Sci-Fi 카테고리의 카테고리 번호는 몇 번인가요?
select category_id
from category c 
where name = 'Sci-Fi'

-- 1-6. film 테이블을 활용하여, rating 등급(?)에 대해서, 몇 개의 등급이 있는지 확인해보세요.
select count(distinct rating)
from film f 
-- 유니크한 등급을 확인하려면
select distinct rating
from film f 

-- 1-7. 대여 기간이 (회수 - 대여일) 10일 이상이었던 rental 테이블에 대한 모든 정보를 알려주세요.
-- 단 , 대여기간은 대여일자부터 대여기간으로 포함하여 계산합니다.
select *
from rental r 
where date(return_date) - date(rental_date) + 1 >= 10 

-- 1-8. 고객의 id가 50,100,150.. 등 50번의 배수에 해당하는 고객들에 대해서, 회원 가입 감사 이벤트를 진행하려고 합니다. 
-- 고객 아이디가 50번 배수인 아이디와 고객의 이름(성, 이름)과 이메일에 대해서 확인해주세요.
select customer_id, last_name, first_name, email
from customer c 
where customer_id % 50 = 0
-- mod()로 나머지를 계산할 수도 있다. 
select customer_id, last_name, first_name, email
from customer c 
where mod(customer_id, 50) = 0

-- 1-9. 영화 제목의 길이가 8글자인, 영화 제목 리스트를 나열해주세요.
-- 띄어쓰기도 길이에 포함된다.
-- length() 활용 
select title 
from film f 
where length(title) = 8

-- 1-10. city 테이블의 city 갯수는 몇 개인가요? 
-- 중복은 고려하지 않는다. 
select count(*)
from city
