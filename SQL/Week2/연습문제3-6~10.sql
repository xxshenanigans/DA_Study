
-- 3.6 Jon Stephens 직원을 통해 dvd대여를 한 payment 기록 정보를 확인하려고 합니다.
-- payment_id, 고객 이름과 성, rental_id, amount, staff 이름과 성을 알려주세요.
select payment_id , c.first_name , c.last_name , rental_id , amount , s.first_name , s.last_name 
from payment p 
join staff s on p.staff_id = s.staff_id 
join customer c on p.customer_id = c.customer_id 
where s.first_name = 'Jon' and s.last_name = 'Stephens'

-- 3.7 배우가 출연하지 않는 영화의 film_id, title, release_year, rental_rate, length를 알려주세요.
-- film 중 배우가 출연하는 영화는 film_actor에 저장
-- `from film`일 때 left outer join 적용
-- film과 film_actor가 매치되지 않으면 film_actor 데이터가 NULL 처리되며 배우가 출연하지 않는 영화로 볼 수 있다.
select f.film_id , title , release_year , rental_rate , length 
from film f 
left outer join film_actor fa on f.film_id = fa.film_id 
where fa.actor_id is null 

-- 3.8 store 상점 id별 주소(address, address2, distict)와 해당 상점이 위치한 city 주소를 알려주세요.
select store_id , a.address , a.address2 , a.district , c.city 
from store s 
join address a on s.address_id = a.address_id 
join city c on a.city_id = c.city_id
-- `from store`일 때 left outer join을 적용하면 store와 매치되지 않는 address 데이터는 NULL 처리된다.
select store_id , a.address , a.address2 , a.district , c.city 
from store s 
left outer join address a on s.address_id = a.address_id 
left outer join city c on a.city_id = c.city_id

-- 3.9 고객의 id별로 고객의 이름(first_name, last_name), 이메일, 고객의 주소(address, district), phone번호, city, country를 알려주세요.
select customer_id , first_name , last_name , email , a.address , a.district , a.phone , c2.city , c3.country 
from customer c 
join address a on c.address_id = a.address_id 
join city c2 on a.city_id = c2.city_id 
join country c3 on c2.country_id = c3.country_id

-- 3.10 
-- != 대신 `not in ()` 적용해도 성립 
select first_name , last_name , email , a.phone , c3.country , c2.city 
from customer c 
join address a on c.address_id = a.address_id 
join city c2 on a.city_id = c2.city_id 
join country c3 on c2.country_id = c3.country_id 
where c3.country != 'china'

