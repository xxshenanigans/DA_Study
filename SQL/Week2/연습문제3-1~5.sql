
-- 3-1. 고객의 기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone 번호를 함께 보여주세요.
select customer_id , first_name , last_name , email , a.address , a.district , a.postal_code , a.phone 
from customer c 
join address a on c.address_id = a.address_id 

-- 3-2. 고객의 기본 정보인, 고객 id, 이름, 성, 이메일과 함께 고객의 주소 address, district, postal_code, phone, city를 함께 알려주세요.
select customer_id , first_name , last_name , email , a.address , a.district , a.postal_code , a.phone , c2.city 
from customer c 
join address a on c.address_id = a.address_id 
join city c2 on a.city_id = c2.city_id 
-- address, city와 매칭되지 않는 customer 데이터도 모두 보려면 `left outer join` 적용
select customer_id , first_name , last_name , email , a.address , a.district , a.postal_code , a.phone , c2.city 
from customer c 
left outer join address a on c.address_id = a.address_id 
left outer join city c2 on a.city_id = c2.city_id 

-- 3-3. Lima City에 사는 고객의 이름과, 성, 이메일, phonenumber에 대해서 알려주세요.
select first_name , last_name , email , a.phone 
from customer c 
join address a on c.address_id = a.address_id 
join city c2 on a.city_id = c2.city_id 
where c2.city = 'Lima'

-- 3-4. rental 정보에 추가로, 고객의 이름과, 직원의 이름을 함께 보여주세요.
-- 고객의 이름, 직원 이름은 이름과 성을 fullname 컬럼으로 만들어서 직원이름/고객이름 2개의 컬럼으로 확인해주세요.
select *, s.first_name || ' ' || s.last_name as staff_fullname, c.first_name || ' ' || c.last_name as customer_fullname
from rental r
left outer join customer c on r.customer_id = c.customer_id 
left outer join staff s on r.staff_id = s.staff_id 

-- 3-5. seth.hannon@sakilacustomer.org 이메일 주소를 가진 고객의  주소 address, address2, postal_code, phone, city 주소를 알려주세요.
select address , address2 , postal_code , phone , c2.city 
from address a
join customer c on a.address_id = c.address_id 
join city c2 on a.city_id = c2.city_id 
where c.email = 'seth.hannon@sakilacustomer.org'

