
-- 5-6. 직원과  고객의 이름이 동일한 사람이 혹시 있나요? 있다면, 해당 사람의 이름과 성을 알려주세요.
-- first_name만 같은 사람은 존재하지만 last_name까지 모두 같은 사람은 없다. 
select first_name , last_name 
from customer c 
intersect
select first_name , last_name 
from staff s 

-- 5-7. 반납이 되지 않은 대여점(store)별 영화 재고(inventory)와 전체 영화 재고를 같이 구하세요. (union all)
-- 전체 영화 재고의 store_id는 null 입력
select store_id , count(film_id)
from inventory i 
join rental r on i.inventory_id = r.inventory_id 
where r.return_date is null
group by store_id 
union all
select null as store_id , count(film_id)
from inventory i 
join rental r on i.inventory_id = r.inventory_id 
where r.return_date is null

-- 5-8. 국가(country)별 도시(city)별 매출액, 국가(country)별 매출액 소계, 그리고 전체 매출액을 구하세요. (union all)
-- 국가별 도시별, 국가별 매출액이 국가별로 정렬되도록 
select c3.country, c2.city, sum(amount) as amount
from payment p 
join customer c on p.customer_id = c.customer_id 
join address a on c.address_id = a.address_id 
join city c2 on a.city_id = c2.city_id 
join country c3 on c2.country_id = c3.country_id 
group by c3.country_id , c2.city_id
union all 
select c6.country , null , sum(amount)
from payment p2 
join customer c4 on p2.customer_id = c4.customer_id 
join address a2 on c4.address_id = a2.address_id 
join city c5 on a2.city_id = c5.city_id 
join country c6 on c5.country_id = c6.country_id 
group by c6.country_id 
union all 
select null , null, sum(amount)
from payment 
order by 1, 2

