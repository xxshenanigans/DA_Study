
-- 1-11. 영화배우의 이름(이름+' '+성)에 대해서 대문자로 이름을 보여주세요. 
-- 단, 고객의 이름이 동일한 사람이 있다면 중복 제거하고 알려주세요.
select distinct upper(first_name||' '||last_name)
from actor a 

-- 1-12. 고객 중에서 active 상태가 0인, 즉 현재 사용하지 않고 있는 고객의 수를 알려주세요.
select count(*)
from customer c
where active = 0
-- 중복된 고객이 있다면 유니크한 고객을 출력해야 한다. 
select count(distinct customer_id)
from customer c
where active = 0

-- 1-13. Customer 테이블을 활용하여, store_id = 1에 매핑된 고객의 수는 몇 명인지 확인해보세요.
select count(distinct customer_id)
from customer c 
where store_id = 1

-- 1-14. rental 테이블을 활용하여, 고객이 return 했던 날짜가 2005년6월20일에 해당했던 rental의 갯수가 몇 개였는지 확인해보세요.
-- date()는 string을 반환한다. 
select count(distinct rental_id) 
from rental r 
where date(return_date) = '2005-06-20'

-- 1-15. film 테이블을 활용하여, 2006년에 출시가 되고 rating이 'G' 등급에 해당하며, 대여기간이 3일에 해당하는 것에 대한 film 테이블의 모든 컬럼을 알려주세요.
select *
from film f 
where release_year=2006 and rating='G' and rental_duration=3

-- 1-16. language 테이블에 있는 id, name 컬럼을 확인해보세요.
select language_id, name
from language l 

-- 1-17. film 테이블을 활용하여, rental_duration이 7일 이상 대여가 가능한 film에 대해서 film_id, title, description 컬럼을 확인해보세요.
select film_id, title, description 
from film f 
where rental_duration >= 7

-- 1-18. film 테이블을 활용하여, rental_duration 대여가 가능한 일자가 3일 또는 5일에 해당하는 film_id, title, desciption을 확인해주세요.
select film_id , title , description 
from film f
where rental_duration = 3 or rental_duration = 5

-- 1-19. Actor 테이블을 이용하여, 이름이 Nick이거나 성이 Hunt인 배우의 id와 이름, 성을 확인해주세요.
select actor_id , first_name , last_name 
from actor a 
where first_name = 'Nick' or last_name = 'Hunt'

-- 1-20. Actor 테이블을 이용하여, Actor 테이블의 first_name 컬럼과 last_name 컬럼을 firstname, lastname으로 컬럼명을 바꿔서 보여주세요.
select first_name as firstname, last_name as lastname
from actor a 

