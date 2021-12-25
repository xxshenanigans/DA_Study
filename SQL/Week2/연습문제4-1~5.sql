
-- 4-1. store별로 staff는 몇 명이 있는지 확인해주세요.
select store_id , count(*)
from staff s 
group by store_id 

-- 4-2. 영화등급(rating)별로 몇 개 영화film을 가지고 있는지 확인해주세요.
select rating , count(*)
from film f 
group by rating 

-- 4-3. 출연한 영화배우(actor)가 10명 초과한 영화명은 무엇인가요?
-- 출연한 배우가 10명 초과인 film_id를 서브쿼리로 입력
-- film에서 서브쿼리를 만족하는 film_id에 대해 title 반환 
select title
from film f 
where film_id in (select film_id from film_actor fa group by film_id having count(*)>10)
-- from에 서브쿼리 활용
select title
from (select film_id , count(*) from film_actor fa group by film_id having count(*)>10) fc
join film f on fc.film_id = f.film_id

-- 4-4. 영화 배우(actor)들이 출연한 영화는 각각 몇 편인가요?
-- 영화 배우의 이름, 성과 함께 출연 영화 수를 알려주세요.
select a.first_name , a.last_name , count(*)
from film_actor fa 
join actor a on fa.actor_id = a.actor_id 
group by a.actor_id 
-- 서브쿼리 활용
select first_name, last_name, fa.cnt
from (select actor_id , count(*) as cnt from film_actor fa group by actor_id) fa
join actor a on fa.actor_id = a.actor_id  

-- 4-5. 국가(country)별 고객(customer)은 몇명인가요?
select c3.country , count(c.customer_id)
from customer c 
join address a on c.address_id = a.address_id 
join city c2 on a.city_id = c2.city_id 
join country c3 on c2.country_id = c3.country_id 
group by c3.country 

