
-- 5-1. 영화 배우가 영화 180분 이상의 길이의 영화에 출연하거나,영화의 rating이 R인 등급에 해당하는 영화에 출연한 영화 배우에 대해서, 영화 배우 ID와 (180분이상 / R등급영화)에 대한 Flag 컬럼을 알려주세요.
-- film_actor 테이블와 film 테이블을 이용하세요.
-- union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
-- actor_id가 동일한 flag값이 여러 개 나오지 않도록 해주세요.
select actor_id , 'length_flag' as flag
from film_actor fa 
where film_id in (
select film_id 
from film f
where length>=180)
union 
select actor_id , 'rating_flag' as flag 
from film_actor fa2
where film_id in (
select film_id 
from film f2
where rating='R')

-- 5-2. R등급의 영화에 출연했던 배우이면서, 동시에, Alone Trip의 영화에 출연한 영화배우의 ID를 확인해주세요.
-- film_actor 테이블와 film 테이블을 이용하세요.
-- union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
select actor_id
from film f 
join film_actor fa on f.film_id = fa.film_id 
where title = 'Alone Trip'
intersect
select actor_id
from film f2 
join film_actor fa2 on f2.film_id = fa2.film_id 
where rating = 'R'
-- 서브쿼리 이용
SELECT actor_id
FROM   film_actor fa
WHERE  film_id IN (SELECT film_id
                   FROM   film
                   WHERE  rating = 'R')
INTERSECT
SELECT actor_id
FROM   film_actor fa
WHERE  film_id IN (SELECT film_id
                   FROM   film f
                   WHERE  title = 'Alone Trip')
-- Alone Trip은 R등급 영화의 부분집합이므로 Alone Trip이 교집합
select actor_id
from film f 
join film_actor fa on f.film_id = fa.film_id 
where title = 'Alone Trip'

-- 5-3. G 등급에 해당하는 필름을 찍었으나, 영화를 20편 이상 찍지 않은 영화배우의 ID를 확인해주세요.
-- film_actor 테이블와 film 테이블을 이용하세요.
-- union, unionall, intersect, except 중 상황에 맞게 사용해주세요.
select actor_id
from film f 
join film_actor fa on f.film_id = fa.film_id 
where rating = 'G'
intersect 
select actor_id 
from film_actor 
group by actor_id 
having count(film_id)<20
-- except 사용 
SELECT actor_id
FROM   film_actor fa
WHERE  film_id IN (SELECT film_id
                   FROM   film
                   WHERE  rating = 'G')
EXCEPT
SELECT actor_id
FROM   film_actor fa
GROUP  BY actor_id
HAVING Count(DISTINCT film_id) >= 20

-- 5-4. 필름 중에서, 필름 카테고리가 Action, Animation, Horror에 해당하지 않는 필름 아이디를 알려주세요.
-- category 테이블을 이용해서 알려주세요.
select film_id
from category c
join film_category fc on fc.category_id = c.category_id 
where name not in ('Action', 'Animation', 'Horror')
-- except, 서브쿼리 사용
select film_id
from film f 
except
select film_id 
from film_category fc 
where category_id in (
select category_id 
from category c 
where name in ('Action', 'Animation', 'Horror')
)

-- 5-5. Staff의 id, 이름, 성에 대한 데이터와 Customer의 id, 이름, 성에 대한 데이터를 하나의 데이터셋의 형태로 보여주세요.
-- 컬럼 구성 : id, 이름, 성, flag(직원/고객여부)로 구성해주세요.
select staff_id as id, first_name , last_name , 'staff' as flag
from staff s 
union all
select customer_id , first_name , last_name , 'customer' as flag
from customer c 

