-- Count of Menus for dish vs menus appeared
select d.id, d.menus_appeared, count(distinct m.id) cnt
from Dish d
join MenuItem mi
on 1=1
and d.id = mi.dish_id
join menupage mp
on 1=1
and mi.menu_page_id = mp.id
join menu m
on mp.menu_id = m.id
group by d.id, d.menus_appeared
having cnt <> d.menus_appeared
;

-- Uniqueness od Dish,id
select id
from dish
where 1=1
group by 1
having count(*)>1
;

-- Data Exploration
select * from Menu where name = ''; 

-- Referencial integrity of Dish in Items
select * from MenuItem where dish_id not in (select id from dish);

-- Referencial integrity of pahe in Items
select * from MenuItem where menu_page_id not in (select id from menupage);

-- Plausibility of Created data
select * from MenuItem where created_at > updated_at;

-- UUID (Universal Unique Id) Uniqueness 
select * from Menupage where uuid is not null;

-- Data Exploration
select * from Menupage;


