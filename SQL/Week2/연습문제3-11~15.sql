
-- 3-11. Horror 카테고리 장르에 해당하는 영화의 이름과 description에 대해서 알려주세요
select title , description 
from film f 
join film_category fc on f.film_id = fc.film_id 
join category c on fc.category_id = c.category_id 
where c.name = 'Horror'

-- 3-12. Music 장르이면서, 영화길이가 60~180분 사이에 해당하는 영화의 title, description, length를 알려주세요.
- 영화 길이가 짧은 순으로 정렬해서 알려주세요.
select title , description , length 
from film f 
join film_category fc on f.film_id = fc.film_id 
join category c on fc.category_id = c.category_id 
where c.name = 'Music' and length between 60 and 180
order by length

-- 3-13. actor 테이블을 이용하여, 배우의 ID, 이름, 성 컬럼에 추가로 'Angels Life' 영화에 나온 영화 배우 여부를 Y, N으로 컬럼을 추가 표기해주세요. 해당 컬럼은 angelslife_flag로 만들어주세요.
-- 서브쿼리는 `title = 'Angels Life'`를 만족하는 actor_id
-- 해당 배우가 서브쿼리에 포함되면 Y, 아니면 N 
select a.actor_id , first_name , last_name , case 
when a.actor_id in (
select fa.actor_id 
from film f 
join film_actor fa on f.film_id = fa.film_id 
where f.title = 'Angels Life') then 'Y'
else 'N'
end as engelslife_flag
from actor a 

-- 3-14. 대여일자가 2005-06-01~14일에 해당하는 주문 중에서, 직원의 이름(이름 성) = 'Mike Hillyer'이거나 고객의 이름(이름 성) = 'Gloria Cook'에 해당하는 rental의 모든 정보를 알려주세요.
-- 추가로 직원 이름과, 고객 이름에 대해서도 fullname으로 구성해서 알려주세요.
select *, s.first_name || ' ' || s.last_name as staff_fullname, c.first_name || ' ' || c.last_name as customer_fullname
from rental r 
left outer join staff s on r.staff_id = s.staff_id 
left outer join customer c on r.customer_id = c.customer_id 
where (date(rental_date) between '2005-06-01' and '2005-06-14') 
and ((s.first_name = 'Mike' and s.last_name = 'Hillyer') or (c.first_name = 'Gloria' and c.last_name = 'Cook')) 

-- 3-15. 대여일자가 2005-06-01~14일에 해당하는 주문 중에서, 직원의 이름(이름 성) = 'Mike Hillyer'에 해당하는 직원에게 구매하지 않은 rental의 모든 정보를 알려주세요.
-- 추가로 직원 이름과, 고객 이름에 대해서도 fullname으로 구성해서 알려주세요.
select *, 
s.first_name || ' ' || s.last_name as staff_fullname, 
c.first_name || ' ' || c.last_name as customer_fullname
from rental r 
left outer join staff s on r.staff_id = s.staff_id 
left outer join customer c on r.customer_id = c.customer_id 
where (date(rental_date) between '2005-06-01' and '2005-06-14') 
and (s.first_name||' '||s.last_name != 'Mike Hillyer')

