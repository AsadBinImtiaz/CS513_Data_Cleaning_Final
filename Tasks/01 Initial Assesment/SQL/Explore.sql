-- Initial Assesment
-- Dish

-- Total Records
SELECT Count(*) AS cnt 
FROM Dish
;
-- 426985

-- uniqueness of PK
SELECT Count(*) AS cnt
FROM Dish 
WHERE 1=1 
GROUP BY id
HAVING cnt <> 1
;
-- No Issues

SELECT MAX(Length(name)) Max_Len
FROM Dish
;
-- 1387 chars;

SELECT 
        Count(Id) AS Row_Count,
        Count(distinct name) As Dish_Name_Count
FROM Dish
;
-- Rows         Names
-- 426985	426951
-- Issue # 1 Consolidate dish names


SELECT 
        Count(Id) AS Row_Count,
        Count(distinct lower(name)) As Dish_Name_Count
FROM Dish
;
-- Rows         Names
-- 426985	398443
-- Issue # 2 Standardize case

SELECT A.Id, A.Name, B.Id, B.Name 
from dish A
Join dish B
ON 1=1
AND A.id <> B.Id
and A.name <> B.Name
And lower(A.name) = lower(B.name)
limit 10
;

SELECT 
        Count(Id) AS Row_Count,
        Count(distinct trim(lower(name))) As Dish_Name_Count
FROM Dish
;
-- Rows         Names
-- 426985	393540
-- Issue # 3 Remove Extra spaces

SELECT 
        Id,
        name,
        trim(name) NSName
FROM Dish
WHERe name <> nsname
;

SELECT 
        Count(Id) AS Row_Count,
        Count(distinct REPLACE(trim(lower(name)),'"','')) As Dish_Name_Count
FROM Dish
;
-- Rows         Names
-- 426985	393062
-- Issue # 4 Remove Quotes from name

SELECT 
        id,name,
        REPLACE(name,'"','') NName
FROM Dish
where name <> NName
;

SELECT 
        max(length(REPLACE(REPLACE(trim(lower(name)),'"',''),'''',''))) As Dish_Name_Count
FROM Dish
;
-- 1377 Chars

SELECT 
        count(distinct REPLACE(REPLACE(REPLACE(trim(lower(name)),'"',''),'''',''),'&','and')) As Dish_Name_Count
FROM Dish
;
-- Dish_Name_Count
-- 391424

SELECT 
        id, name, REPLACE(REPLACE(REPLACE(((name)),'"',''),'{',''),'&','and') NName
FROM Dish
where name <> NName
;

SELECT 
        distinct TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(lower(name),'"',''),'}',''),'{',''),'&','and'),'  ',' '),'#',''),'!',''),'*','')) As Dish_Name_Count
FROM Dish
order by 1;
limit 10
;
-- Dish_Name_Count
-- Issue # 5 Remove invalid characters Quotes from name such as (#@!*)

select *
FROM
(
SELECT 
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(lower(name),'"',''),'}',''),'{',''),'&','and'),'  ',' '),'#',''),'!',''),'*','')) As NName,
        d.*
FROM Dish d
) d1
Join Dish d2
on d1.Nname = d2.name
and d1.id<> d2.id
;
-- Dish_Name_Count
-- Issue # 5 Remove invalid characters Quotes from name such as (#@!*)

SELECT 
      COALESCE (nullif(trim(description),''),'NULL') AS Description, count(*) As Freq
FROM Dish
GROUP by 1
ORDER BY 2
limit 10
;
-- Issue #5 Remove column description

SELECT 
      menus_appeared, count(*) As Freq
FROM Dish
GROUP by 1
ORDER BY 1
--limit 100
;
-- 2412 Dishes appeared in 0 Menus ??? [MIN]
-- 1 dishes apperaed in 7748 Menus [MAX]

-- To Dishes from appearance
SELECT 
      name, menus_appeared, count(*) As Freq
FROM Dish
WHERE 1=1
AND menus_appeared > 1000
GROUP by 1,2
ORDER BY 2 desc
limit 10
;
--name	menus_appeared	Freq
--Coffee	        7748	1
--Olives	        4323	1
--Celery	        4249	1
--Tea	                4164	1
--Radishes	        3263	1
--Mashed potatoes	2575	1
--Boiled potatoes	2063	1
--Fruit	                1918	1
--Milk	                1896	1
--Chicken salad	        1807	1

SELECT 
      times_appeared, count(*) As Freq
FROM Dish
GROUP by 1
ORDER BY 1
limit 25
;
-- Negative numbers in times_appeared
-- 1 Dishes appeared -10 times ??? [MIN]
-- 11900 dishes appeared 0 times !!!
-- 372 dishes apperaed 19 Menus [MAX]
-- Issue #6 times_appeared must be positive


-- Count of Menus for dish vs menus appeared
select  d.id, d.menus_appeared, 
        count(distinct m.id) cnt
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
order by abs(d.menus_appeared-cnt)
limit 10
;
-- menus_appeared value mismatches number of menues dish appeared in
-- Top Values
-- id	menus_appeared	cnt
-- 19	16	15
-- 48	767	768
-- 123	16	15
-- 196	62	61
-- 298	3	2
-- 594	2	1
-- 670	52	51
-- 727	17	16
-- 745	3	2
-- 827	14	13
--
-- Issue #7 Correctness of Menus appeared

-- Count of time for dish in menu item vs times appeared
select  d.id, d.times_appeared, 
        count(distinct mi.id) cnt
from Dish d
join MenuItem mi
on 1=1
and d.id = mi.dish_id
group by d.id, d.times_appeared
having cnt <> d.times_appeared
order by abs(d.times_appeared-cnt)
limit 10
;
-- Correctless of time appeared
-- Value mismatch
-- id  times_appeared cnt  
-- -- -------------- ---- 
-- 17  535            536  
-- 27  292            293  
-- 42  259            260  
-- 95  1171           1172 
-- 143 499            500  
-- 163 898            899  
-- 208 18             19   
-- 246 610            611  
-- 286 586            587  
-- 544 455            456  
--
-- Issue #8 Correctness of times appeared

select count(*)
from dish
where first_appeared is null
;
-- 0

-- Correctness of first appeared
select distinct 
        first_appeared, Calc_first_appeared, count(*)
FROM
(
select  
        d.id, d.first_appeared, d.last_appeared,
        min(substr(m.date,1,4)) over (partition by d.id) AS Calc_first_appeared,
        max(substr(m.date,1,4)) over (partition by d.id order by m.date) AS Calc_last_appeared
from Dish d
join MenuItem mi
on 1=1
and d.id = mi.dish_id
join menupage mp
on 1=1
and mi.menu_page_id = mp.id
join menu m
on mp.menu_id = m.id
) AS X
where not (first_appeared = Calc_first_appeared)
and Calc_first_appeared is not null
;
-- Many dishes have first appearance earlier than menu date, is it plausable
-- ISSUE 9# Correntness of first_appeared, last_appeared

-- Plausinility og first appeared >= last_appeared
select  
        d.id, d.first_appeared, d.last_appeared
from Dish d
where d.first_appeared > d.last_appeared
;
-- Plausibility 
-- id     first_appeared last_appeared 
-- ------ -------------- ------------- 
-- 164029 1900           0             
-- 204888 1900           0             
-- 250693 1945           0             
-- 250699 1945           0             
-- 301736 1940           0             
-- 309629 1947           0             
-- ISSUE 9# Plausibility of first_appeared > last_appeared

-- Plausinility og first lowest_price > highest_price
select  
        d.id, d.lowest_price, d.highest_price
from Dish d
where not (d.lowest_price <= d.highest_price)
;
-- Plausibility lowest_price > highest_price
-- No Error

-- Plausinility og first lowest_price > highest_price
select  
        d.id, d.lowest_price, d.highest_price
from Dish d
where (d.lowest_price is null and d.highest_price is not null)
OR
(d.lowest_price is not null and d.highest_price is null)
;

select  
        d.id, d.lowest_price
from Dish d
where d.lowest_price <= 0
order by 2 
;

select  
        d.id, d.highest_price
from Dish d
where d.highest_price <= 0
order by 2 
;

-- missing values for Lowest_price, highest_price
select * from dish where lowest_price is null
limit 10
;
select * from dish where highest_price is null
limit 10
;

---------------------------------------------------------------------------------
-- Table: MenuItem
select * from MenuItem
limit 100
;


-- Uniqueness of PK
select id, count(*) cnt
from menuitem
where 1=1
group by 1
having cnt > 1
;
-- no Issue

-- Nulls in FK for menu page
select id, menu_page_id
from menuitem
where 1=1
and menu_page_id is null
;
--no issue

-- Nulls in FK for menu page
select id, dish_id
from menuitem
where 1=1
and dish_id is null
;
-- 241 null values

-- RI Issue
select id, menu_page_id
from menuitem
where 1=1
and menu_page_id not in (select id from menupage)
;
-- no RI Voilation with Menu Page

-- RI Issue
select id, dish_id
from menuitem
where 1=1
and dish_id not in (select id from dish)
;
--3 RI Voilations with Dish

-- Price
select count(*)
from menuitem
where 1=1
and price is null
;
-- Many nulls
-- 446150/1334419

-- Price
select count(*)
from menuitem
where 1=1
and price is null
and high_price is not null
;
-- Many nulls
-- 446150/1334419

-- High Price
select count(*)--id, high_price
from menuitem
where 1=1
and high_price is null
;
-- Many nulls

-- High Price
select count(*)--id, high_price
from menuitem
where 1=1
and high_price is null
and price is not null
;

-- Plausibility of price
select * --Count(*)
from menuitem
where 1=1
and high_price < price
and price is not null
and high_price is not null
;
-- 1278 Price > High_Price

-- Plausibility of price
select Count(*)
from menuitem
where 1=1
and high_price < price
;
-- 1278 Price > High_Price

-- Nulls in dates
select Count(*)
from menuitem
where 1=1
and created_at is null
;
-- No rows

-- Nulls in dates
select Count(*)
from menuitem
where 1=1
and updated_at is null
;
-- No rows

-- plausibilkity of dates
select * --Count(*)
from menuitem
where 1=1
and updated_at < created_at
;
-- 2874 voilations

select xpos, ypos
from menuitem
where xpos is null or ypos is null
;
-- no rows

select xpos, ypos
from menuitem
where 1=1
order by 1 desc
limit 10
;
-- no rows

select min(xpos), max(xpos), min(ypos), max(ypos)
from menuitem
where 1=1
limit 10
;
-- no rows

select *
from menuitem
where 1=1
and xpos = 0 or ypos = 0
;
-- 9 rows

select count(*)
from menuitem
where 1=1
and xpos < 0
;
-- no rows

select count(*)
from menuitem
where 1=1
and ypos < 0
;
-- no rows

-----------------------------------------------------------------------------------
-- Menu Page

select * from MenuPage 
limit 10
;

-- Uniuqueness of PK
select id 
from menupage
group by 1
having count(*) > 1
;
-- No Issue

select id 
from menupage
where id is null
;
-- No Issue

select max(id), min(id) 
from menupage
;
-- No Issue

select  *
from menupage
where menu_id not in (select id from menu)
;
-- 5803 Nulls

select  count(*)
from menupage
where menu_id is null
;
-- 5803 Nulls

select  count(*)
from menupage
where page_number is null
;
-- 1202 Nulls

select  max(page_number),min(page_number)
from menupage
;
-- Range 1-74

select  page_number , count(*)
from menupage
group by 1
order by 1
;
-- (null)	1202
-- 1	18832
-- 2	17918
-- 3	8627
-- 4	6825
-- 5	2714
-- 6	2145
-- 7	1681
-- 8	1479
-- 9	810
-- 10	707
--  ...
-- 66	1
-- 67	1
-- 68	1
-- 69	1
-- 70	1
-- 71	1
-- 72	1
-- 73	1
-- 74	1


select  count(*)
from  menupage
where image_id is null
;
-- 0 Nulls

select *
from menupage mp
join menuitem mi
on 1=1
and mi.menu_page_id = mp.id
where mp.image_id is null
and (mi.xpos is not null or mi.ypos is not null)
;
-- 0


select  max(image_id),min(image_id)
from menupage
;
-- Range
-- psnypl_rbk_988	1603591

select count(*)
from menupage
where lower(image_id) < 'a'
;
-- 66914

select count(*)
from menupage
where lower(image_id) >= 'a'
;
-- 23

select *
from menupage
where lower(image_id) >= 'a'
;

select menu_id, page_number, count(image_id), min(Image_id), max(image_id)
from menupage
where 1=1
group by 1,2
having count(image_id) > 1
;


select  max(length(image_id))
from menupage
;
-- 15

select  count(*)
from menupage
where full_height is null
;
-- 329 Nulls

select  count(*)
from menupage
where full_width is null
;
-- 329 Nulls

select  count(*)
from  menupage
where full_width is null
and image_id is not null
;
-- 329 Nulls

select  max(full_height),min(full_height)
from menupage
;
-- Range
-- 12044	616

select  max(full_width),min(full_width)
from menupage
;
-- Range
-- 9175	        558

-- Correctness
select  id
from menupage
where image_id is null
and 
( full_height is not null 
  or 
  full_width is not null
)
;
-- No Issues

-- Correctness
select  id
from menupage
where image_id is not null
and 
( full_height is null 
  or 
  full_width is null
)
;
-- 329

select  m.id
from menupage m
join (Select menu_id, image_id from menupage where full_height not null or full_width is not null) m2
where m.image_id is not null
and 
( full_height is null 
  or 
  full_width is null
)
and m.menu_id = m2.menu_id
and m.image_id = m2.image_id
;
-- no rows

select uuid
from menupage
limit 10
;

select uuid, count(*)
from menupage
group by 1
having count(*) > 1
;
-- 66937

select uuid, count(*)
from menupage
group by 1
;
-- 66937 NULLs

select updated_at
from menupage
limit 10
;

select Count(*) FROM
(
select updated_at, count(*)
from menupage
group by 1
having count(*)> 1
)
X
;
-- 2922 duplicates

select *
FROM
(
select updated_at, count(*)
from menupage
group by 1
having count(*)> 1
)
X
;
-- 2922 duplicates

select  max(updated_at),min(updated_at)
from menupage
;
-- Range
-- fff6dec0-5168-0132-81d8-58d385a7b928	000b9940-5169-0132-ef55-58d385a7b928

select  max(length(updated_at)),min(length(updated_at))
from menupage
;
-- 36, 36

----------------------------------------------------------------------------------
-- Menu
 
select * from menu
limit 10
;


-- uniqueness
select id
from menu
where 1=1
group by 1
having count(*)>1
;

-- uniqueness
select id
from menu
where 1=1
and id is null
;


SELECT MAX(Length(name)) Max_Len
FROM menu
;
-- 77

SELECT Count(*) 
FROM menu
where name is null
;
-- 0

SELECT Count(*) 
FROM menu
where trim(name) = ''
;
-- 1387 chars;


SELECT 
        Count(Id) AS Row_Count,
        Count(distinct Lower(name)) As Name_Count
FROM menu
where trim(name) <> ''
;
-- Rows         Names
-- 3197	        793
-- Issue # 1 Consolidate dish names


SELECT A.Id, A.Name, B.Id, B.Name , A.status, B.Status, A.Date, B.Date, A.Location, B.location
from menu A
Join menu B
ON 1=1
AND A.id <> B.Id
and A.name <> B.Name
And lower(A.name) = lower(B.name)
and trim(A.name) <> ''
and trim(B.name) <> ''
limit 100
;

SELECT 
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(lower(name),'"',''),'}',''),'{',''),'&','and'),'  ',' '),'#',''),'!',''),'*','')) As Dish_Name_Count, Count(*)
FROM menu
WHERE trim(name) <> ''
group by 1
order by 1
limit 100
;
--Namet	Count(*)
--[restaurant name and/or location not given]	118
--adams' restaurant	28
--adam's restaurant	16
--astor house	14
--cafÃ© new york restaurant	13
--cavanagh's	13
--adams' dining room	11
--broadway central hotel	10
--blackstone	7
--[not given]	5


SELECT MAX(Length(sponsor)) Max_Len
FROM menu
;
-- 77

SELECT Sponsor
FROM menu
group by 1
Having MAX(Length(sponsor)) > 100
;


SELECT Count(*) 
FROM menu
where sponsor is null
;
-- 0

SELECT Count(*) 
FROM menu
where trim(sponsor) = ''
;
-- 1387 chars;



SELECT 
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(lower(sponsor),'"',''),'}',''),'{',''),'&','and'),'  ',' '),'#',''),'!',''),'*','')) As Dish_Name_Count, Count(*)
FROM menu
WHERE trim(sponsor) <> ''
group by 1
order by 2 desc
limit 100
;
--Namet	Count(*)
--[restaurant name and/or location not given]	118
--adams' restaurant	28
--adam's restaurant	16
--astor house	14
--cafÃ© new york restaurant	13
--cavanagh's	13
--adams' dining room	11
--broadway central hotel	10
--blackstone	7
--[not given]	5


SELECT Sponsor
FROM menu
group by 1
Having MAX(Length(sponsor)) > 100
;


SELECT Count(*) 
FROM menu
where event is null
;
-- 0

SELECT Count(*) 
FROM menu
where trim(event) = ''
;
-- 1387 chars;



SELECT 
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(lower(event),'"',''),'}',''),'{',''),'&','and'),'  ',' '),'#',''),'!',''),'*','')) As Dish_Name_Count, Count(*)
FROM menu
WHERE trim(event) <> ''
group by 1
order by 2 desc
limit 100
;
--Namet	Count(*)
--[restaurant name and/or location not given]	118
--adams' restaurant	28
--adam's restaurant	16
--astor house	14
--cafÃ© new york restaurant	13
--cavanagh's	13
--adams' dining room	11
--broadway central hotel	10
--blackstone	7
--[not given]	5

SELECT Count(*) 
FROM menu
where venue is null
;
-- 0

SELECT Count(*) 
FROM menu
where trim(venue) = ''
;
-- 1387 chars;

SELECT 
        TRIM(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(lower(venue),'"',''),'}',''),'{',''),'&','and'),'  ',' '),'#',''),'!',''),'*','')) As Dish_Name_Count, Count(*)
FROM menu
WHERE trim(venue) <> ''
group by 1
order by 2 desc
limit 100
;
--Namet	Count(*)
--[restaurant name and/or location not given]	118
--adams' restaurant	28
--adam's restaurant	16
--astor house	14
--cafÃ© new york restaurant	13
--cavanagh's	13
--adams' dining room	11
--broadway central hotel	10
--blackstone	7
--[not given]	5

Select physical_description
from menu
;

Select physical_description
from menu
group by physical_description
having max(length(physical_description)) > 100
;

Select occasion
from menu
;

select notes
from menu
;

select distinct call_number from menu;

select Min(length(call_number)),Max(length(call_number)) from menu where call_number <> ''
;

Select length(call_number), count(*), min(call_number),max(call_number)
from menu
group by 1
;

Select call_number
from menu
group by call_number
having max(length(call_number))  4
;

select keywords from menu where trim(keywords) <> '';
-- All empty

select language from menu where trim(language) <> '';
-- All empty

select date from menu
where date > date '2020-07-01';
-- All empty

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


-- Cardinialties
select case when cnt > 1 then 'N' else '1' end, count(*)
from
(
select d.id, count(distinct mi.id) cnt
from dish d
join menuitem mi
on mi.dish_id = d.id
group by 1
) X
group by 1
;

select location from menu;
select location_type from menu where trim(location_type) <> '';

select status, count(*) from menu group by 1;

select case when cd = 0 then 'broken link' 
        when cd = dish_count then 'Count matches'
        else 'Mismatch'  
       end Issue, count(*), max(id)
from
(
select m.id, m.dish_count, count(d.id) cd
from menupage mp
join menu m
on mp.menu_id = m.id
join menuitem mi
on mp.id = mi.menu_page_id
join dish d
on d.id = mi.dish_id
group by 1,2
) x
group by 1
;
--case	                count(*)	max(id)
--Count matches	        16609	35526
--Mismatch	        1	28017
--Null in MenuPage	935	31891

select count(*) from MenuPage where Page_number is null;
select count(*) from MenuPage where trim(Page_number) = '';

select * from menupage where menu_id = '26364';

select *
from menupage mp
join menu m
on mp.menu_id = m.id
where mp.page_number is null
order by 1;

select * from Menu where id not in 
(select menu_id from menupage group by 1)
;

select count(*) from menupage where menu_id not in 
(select id from menu group by 1)
;

select count(*) from menuITEM where menu_PAGE_id not in 
(select id from menuPAGE group by 1)
;

select count(*) from menupage where id not in 
(select menu_page_id from menuitem group by 1)
;

select * from menuitem where menu_page_id = '119';

select count(*) from menuitem where dish_id not in 
(select id from dish group by 1)
;

select count(*) from dish where id not in 
(select dish_id from menuitem group by 1)
;

select *
from
(
select m.id, m.page_count, count(mp.id) cpage
from menupage mp
join menu m
on mp.menu_id = m.id
group by 1,2
)
where cpage = page_count
;

select m.id, m.dish_count, count(d.id) cd
from menupage mp
join menu m
on mp.menu_id = m.id
join menuitem mi
on mp.id = mi.menu_page_id
join dish d
on d.id = mi.dish_id
group by 1,2
having cd <> dish_count
;

select Max(length(currency_symbol)) from menu;