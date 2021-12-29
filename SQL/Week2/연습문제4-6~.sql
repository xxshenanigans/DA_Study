
-- 4-6. 영화 재고(inventory) 수량이 3개 이상인 영화(film)는?
-- store는 상관없이 확인해주세요.
select title , i.cnt
from film f 
join (select film_id , count(*) cnt from inventory i group by film_id having count(*)>3) i 
on f.film_id = i.film_id 

-- 4-7. dvd 대여를 제일 많이 한 고객 이름은?
select first_name , last_name 
from customer c
join (
select customer_id 
from rental 
group by customer_id 
order by count(*) desc 
limit 1
) r on c.customer_id = r.customer_id 

-- 4-8. rental 테이블을 기준으로, 2005년 5월26일에 대여를 기록한 고객 중, 하루에 2번 이상 대여를 한 고객의 ID 값을 확인해주세요.
select customer_id , count(distinct rental_id)
from rental r 
where date(rental_date) = '2005-05-26'
group by customer_id 
having count(*) >= 2

-- 4-9. film_actor 테이블을 기준으로, 출연한 영화의 수가 많은 5명의 actor_id와, 출연한 영화 수를 알려주세요.
select actor_id , count(distinct film_id)
from film_actor fa 
group by actor_id 
order by count(*) desc
limit 5

-- 4-10. payment 테이블을 기준으로, 결제일자가 2007년2월15일에 해당하는 주문 중에서, 하루에 2건 이상 주문한 고객의 총 결제 금액이 10달러 이상인 고객에 대해서 알려주세요.
-- 고객의 id, 주문건수, 총 결제 금액까지 알려주세요.
select customer_id , count(distinct rental_id) , sum(amount) as total_amount 
from payment p 
where date(payment_date) = '2007-02-15'
group by customer_id 
having count(distinct rental_id) >= 2 and sum(amount) >= 10

-- 4-11. 사용되는 언어별 영화 수는?
select name, count(distinct f.film_id)
from language l
join film f on l.language_id = f.language_id 
group by l.name

-- 4-12. 40편 이상 출연한 영화 배우(actor)는 누구인가요?
select a.first_name , a.last_name , count(*)
from film_actor fa
join actor a on fa.actor_id = a.actor_id 
group by a.actor_id 
having count(*) >= 40

