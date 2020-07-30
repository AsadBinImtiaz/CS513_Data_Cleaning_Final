DROP TABLE IF EXISTS Dish;
DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS MenuItem;
DROP TABLE IF EXISTS MenuPage;


# @BEGIN SQLWorkflow


# @BEGIN ImportDatafromCSV
# @IN Dish @URI file:Data/Dish.csv
# @IN Menu @URI file:Data/Menu.csv
# @IN MenuPage @URI file:Data/MenuPage.csv
# @IN MenuItem @URI file:Data/MenuItem.csv

.mode csv

.import Data/Dish.csv Dish

SELECT '   Dish file added, Total Dishes = ' || COUNT(*) AS Dish_Count FROM Dish;

.import Data/Menu.csv Menu

SELECT '   Menu file added, Total Menus = ' || COUNT(*) AS Menu_Count FROM Menu;

.import Data/MenuPage.csv MenuPage

SELECT '   MenuPage file added, Total MenuPages = ' || COUNT(*) AS MenuPage_Count FROM MenuPage;

.import Data/MenuItem.csv MenuItem

SELECT '   MenuItem file added, Total MenuItems = ' || COUNT(*) AS MenuItem_Count FROM MenuItem;


# @OUT Dish 
# @OUT Menu  
# @OUT MenuPage
# @OUT MenuItem  
# @END ImportDatafromCSV




# @BEGIN CreateDish_New
# @IN Dish 
# @OUT Dish_New 
# @END CreateDish_New


DROP TABLE IF EXISTS Dish_New 
;

CREATE TABLE IF NOT EXISTS Dish_New 
(
        id INTEGER NOT NULL PRIMARY KEY, 
        name TEXT NOT NULL, 
        menus_appeared INTEGER NULL, 
        times_appeared INTEGER NULL, 
        first_appeared INTEGER NULL, 
        last_appeared  INTEGER NULL, 
        lowest_price   NUMERIC NULL, 
        highest_price  NUMERIC NULL
)
;

DELETE FROM Dish_New
;

INSERT INTO Dish_New 
SELECT 
         id
        ,NULLIF(name,'') 
        ,menus_appeared
        ,times_appeared
        ,first_appeared
        ,last_appeared
        ,lowest_price
        ,highest_price
FROM DISH
;


# @BEGIN TrimNameDish_New
# @IN Dish_New 
# @OUT Dish_NewV1 
# @END TrimNameDish_New

UPDATE DISH_New SET NAME = TRIM('Nelson''S Blood (Cocktail)                                              ') WHERE ID = 402726	;
UPDATE DISH_New SET NAME = TRIM('Tio Pepe Sherry                                                         ') WHERE ID = 408306	;
UPDATE DISH_New SET NAME = TRIM('Our Game Plan                                                           ') WHERE ID = 417683	;
UPDATE DISH_New SET NAME = TRIM('Dessert - Gewurztraminer Hugel                                          ') WHERE ID = 418332	;
UPDATE DISH_New SET NAME = TRIM('Rijsttafel - The Rice-Table                                             ') WHERE ID = 418709	;
UPDATE DISH_New SET NAME = TRIM('Croissants Au Jambon - - A Crescent Pastry With Ham                     ') WHERE ID = 419261	;
UPDATE DISH_New SET NAME = TRIM('Souffle Grand Marnier, Les Petit Fours                                  ') WHERE ID = 419302	;
UPDATE DISH_New SET NAME = TRIM('The Wines By Gordon Bass                                                ') WHERE ID = 419313	;
UPDATE DISH_New SET NAME = TRIM('Dole De Sion - Grossenbacher (Dole Duh See-Ohn)                         ') WHERE ID = 419323	;
UPDATE DISH_New SET NAME = TRIM('Chateau Petrus 1959 - Chateau Bottled (Shah-Toe Peh-Trews)              ') WHERE ID = 419325	;
UPDATE DISH_New SET NAME = TRIM('Sylvaner From Alsace France                                             ') WHERE ID = 420659	;
UPDATE DISH_New SET NAME = TRIM('Club Breakfast No. 3                                                    ') WHERE ID = 421319	;
UPDATE DISH_New SET NAME = TRIM('Club Breakfast No. 4                                                    ') WHERE ID = 421340	;
UPDATE DISH_New SET NAME = TRIM('Club Breakfast No. 5                                                    ') WHERE ID = 421341	;
UPDATE DISH_New SET NAME = TRIM('Donahoe''S Farm Style Chicken Dinner                                    ') WHERE ID = 430379	;
UPDATE DISH_New SET NAME = TRIM('Hobeau''S Or Nodelini''S.                                               ') WHERE ID = 438468	;
UPDATE DISH_New SET NAME = TRIM('Hobeau''S Or Nodelini''S.                                               ') WHERE ID = 438470	;
UPDATE DISH_New SET NAME = TRIM('L''Appetite Vient En Mangeant                                           ') WHERE ID = 454063	;
UPDATE DISH_New SET NAME = TRIM('Patrons Meal                                                            ') WHERE ID = 454077	;
UPDATE DISH_New SET NAME = TRIM('Patrons Meal                                                            ') WHERE ID = 454078	;
UPDATE DISH_New SET NAME = TRIM('Patrons Meal                                                            ') WHERE ID = 454079	;
UPDATE DISH_New SET NAME = TRIM('A Teas Of Excellent Quality                                             ') WHERE ID = 454095	;
UPDATE DISH_New SET NAME = TRIM('A Teas Of Excellent Quality                                             ') WHERE ID = 454096	;
UPDATE DISH_New SET NAME = TRIM('Buffet - Quality And The Best Obtainable                                ') WHERE ID = 454140	;
UPDATE DISH_New SET NAME = TRIM('The Early Morn                                                          ') WHERE ID = 454154	;
UPDATE DISH_New SET NAME = TRIM('The Early Morn                                                          ') WHERE ID = 454155	;
UPDATE DISH_New SET NAME = TRIM('The Early Morn                                                          ') WHERE ID = 454156	;
UPDATE DISH_New SET NAME = TRIM('Zakuska - Hors D''Oeuvres                                               ') WHERE ID = 469753	;
UPDATE DISH_New SET NAME = TRIM('Tour D''Argent Of Paris                                                 ') WHERE ID = 469775	;
UPDATE DISH_New SET NAME = TRIM('Sydney Smith Afternoon Tea                                              ') WHERE ID = 471390	;
UPDATE DISH_New SET NAME = TRIM('Dual Purpose Buffet                                                     ') WHERE ID = 486297	;
UPDATE DISH_New SET NAME = TRIM('Broasted Chicken Ala Skillet Dinner                                     ') WHERE ID = 506183	;
UPDATE DISH_New SET NAME = TRIM('Peking Duck In The Great Tradition Of Chinese Haute Cuisine             ') WHERE ID = 514868	;
UPDATE DISH_New SET NAME = TRIM('Charcoal Broiled 1-Lb. Short Loin Steak                                 ') WHERE ID = 427545	;
UPDATE DISH_New SET NAME = TRIM('Souffle Grand Marnier, Les Petit Fours                                  ') WHERE ID = 419300	;
UPDATE DISH_New SET NAME = TRIM('The Early Morn                                                          ') WHERE ID = 454152	;
UPDATE DISH_New SET NAME = TRIM('The Early Morn                                                          ') WHERE ID = 454153	;
UPDATE DISH_New SET NAME = TRIM('Meal At The Sepasco Trail And King''S Highway                           ') WHERE ID = 486298	;
UPDATE DISH_New SET NAME = TRIM('Nelson''S Blood (Cocktail)                                              ') WHERE ID = 402723	;
UPDATE DISH_New SET NAME = TRIM('Beef And Cheese - Bonnes-Mares - 1959                                   ') WHERE ID = 418331	;
UPDATE DISH_New SET NAME = TRIM('Selle De Veau, Bouquetiere De Legumes                                   ') WHERE ID = 419279	;
UPDATE DISH_New SET NAME = TRIM('Charcoal Grilled Planked Steak Or Chicken Dinner                        ') WHERE ID = 430396	;
UPDATE DISH_New SET NAME = TRIM('British Airways Wines                                                   ') WHERE ID = 436648	;
UPDATE DISH_New SET NAME = TRIM('Buffet - Quality And The Best Obtainable                                ') WHERE ID = 454130	;
UPDATE DISH_New SET NAME = TRIM('Beware Of Fakirs                                                        ') WHERE ID = 454174	;
UPDATE DISH_New SET NAME = TRIM('Jake''S Fresh Sheet                                                     ') WHERE ID = 469646	;
UPDATE DISH_New SET NAME = TRIM('Jake''S Fresh Sheet                                                     ') WHERE ID = 469647	;
UPDATE DISH_New SET NAME = TRIM('Zakuska Of Fish                                                         ') WHERE ID = 469755	;
UPDATE DISH_New SET NAME = TRIM('Red Snapper Fillet On Salsify Sauce                                     ') WHERE ID = 469761	;
UPDATE DISH_New SET NAME = TRIM('Lamb 3 Ways                                                             ') WHERE ID = 469764	;
UPDATE DISH_New SET NAME = TRIM('Lamb 3 Ways                                                             ') WHERE ID = 469766	;
UPDATE DISH_New SET NAME = TRIM('Fallow Venison Medallion, A La Minute                                   ') WHERE ID = 469773	;
UPDATE DISH_New SET NAME = TRIM('Chateau De La Ragotiere 1992 To Accompany This Dish                     ') WHERE ID = 471365	;
UPDATE DISH_New SET NAME = TRIM('Autumn Applefest Breakfast                                              ') WHERE ID = 512916	;
UPDATE DISH_New SET NAME = TRIM('Clos Vougeot, 1961 (Louis Jadot - Estate Bottled)                       ') WHERE ID = 516524	;
UPDATE DISH_New SET NAME = TRIM('Bestimmte Stoffe                                                        ') WHERE ID = 517040	;
UPDATE DISH_New SET NAME = TRIM('e Have The Finest Vintages Available In Imported Wines                  ') WHERE ID = 417938	;
UPDATE DISH_New SET NAME = TRIM('Dezaley- 1964 - Grossenbacher (Day-Za-Lay)                              ') WHERE ID = 419311	;
UPDATE DISH_New SET NAME = TRIM('Pommery Brut 1961 - En Methusalems                                      ') WHERE ID = 419314	;
UPDATE DISH_New SET NAME = TRIM('Chateau D''Auvernier, Chateau Bottled Neuchatel (Shah-Toe Doh-Vern-Yerr)') WHERE ID = 419318	;
UPDATE DISH_New SET NAME = TRIM('Dole De Sion - Grossenbacher (Dole Duh See-Ohn)                         ') WHERE ID = 419321	;
UPDATE DISH_New SET NAME = TRIM('Club Breakfast No. 2                                                    ') WHERE ID = 421318	;
UPDATE DISH_New SET NAME = TRIM('Diamond-Back-Terrapin                                                   ') WHERE ID = 421850	;
UPDATE DISH_New SET NAME = TRIM('Fried Chicken - Negro Cooks                                             ') WHERE ID = 421853	;
UPDATE DISH_New SET NAME = TRIM('Chateaubriand Strasbourgeoise                                           ') WHERE ID = 427609	;
UPDATE DISH_New SET NAME = TRIM('Booze At D.B.                                                           ') WHERE ID = 428470	;
UPDATE DISH_New SET NAME = TRIM('Ain''T She Sweet                                                        ') WHERE ID = 428483	;
UPDATE DISH_New SET NAME = TRIM('From Our Charcoal Hearth                                                ') WHERE ID = 429473	;
UPDATE DISH_New SET NAME = TRIM('Lanson Black Label Champagne                                            ') WHERE ID = 436650	;
UPDATE DISH_New SET NAME = TRIM('J. Lohr Riverstone Chardonnay 1989                                      ') WHERE ID = 436655	;
UPDATE DISH_New SET NAME = TRIM('Festival Of The Season                                                  ') WHERE ID = 438463	;
UPDATE DISH_New SET NAME = TRIM('Coffee - Our Original Blend                                             ') WHERE ID = 454105	;
UPDATE DISH_New SET NAME = TRIM('Quilcene Opysters*, Jake''S Fresh Sheet                                 ') WHERE ID = 469642	;
UPDATE DISH_New SET NAME = TRIM('Portobello Mushroom And Le Seurre Baby Peas                             ') WHERE ID = 469756	;
UPDATE DISH_New SET NAME = TRIM('Lamb 3 Ways                                                             ') WHERE ID = 469762	;
UPDATE DISH_New SET NAME = TRIM('The Keller Family''S Special Steak                                      ') WHERE ID = 470642	;
UPDATE DISH_New SET NAME = TRIM('The Beekman Arms                                                        ') WHERE ID = 486296	;
UPDATE DISH_New SET NAME = TRIM('The Earth Burger. Vegetarian                                            ') WHERE ID = 490882	;
UPDATE DISH_New SET NAME = TRIM('The Earth Burger. Vegetarian                                            ') WHERE ID = 490883	;
UPDATE DISH_New SET NAME = TRIM('Barbecued Salmon: Done Indian Style                                     ') WHERE ID = 512180	;
UPDATE DISH_New SET NAME = TRIM('Barbecued Salmon: Done Indian Style                                     ') WHERE ID = 512181	;
UPDATE DISH_New SET NAME = TRIM('Bestimmte Stoffe                                                        ') WHERE ID = 517038	;
UPDATE DISH_New SET NAME = TRIM('Bestimmte Stoffe                                                        ') WHERE ID = 517039	;
UPDATE DISH_New SET NAME = TRIM('Bestimmte Stoffe                                                        ') WHERE ID = 517037	;
UPDATE DISH_New SET NAME = TRIM('Incomparable Crepe Ricardo - Dessert Supreme!                           ') WHERE ID = 517202	;
UPDATE DISH_New SET NAME = TRIM('Chateau Cheval Blanc, 1961 (Chateau Bottled)                            ') WHERE ID = 516523	;
UPDATE DISH_New SET NAME = TRIM('Breaded Veal Parmigiana, Tender Veal Breaded                            ') WHERE ID = 504229	;
UPDATE DISH_New SET NAME = TRIM('Breaded Veal Parmigiana, Tender Veal Breaded                            ') WHERE ID = 504230	;
UPDATE DISH_New SET NAME = TRIM('All Entrees Served With Choice Of Potato, Breads, Butter                ') WHERE ID = 470664	;
UPDATE DISH_New SET NAME = TRIM('All Entrees Served With Choice Of Potato, Breads, Butter                ') WHERE ID = 470665	;
UPDATE DISH_New SET NAME = TRIM('Baked Lasagne, Wide Egg Noodle                                          ') WHERE ID = 504227	;
UPDATE DISH_New SET NAME = TRIM('Baked Lasagne, Wide Egg Noodle                                          ') WHERE ID = 504228	;
UPDATE DISH_New SET NAME = TRIM('Beware Of Fakirs                                                        ') WHERE ID = 454169	;
UPDATE DISH_New SET NAME = TRIM('Beware Of Fakirs                                                        ') WHERE ID = 454170	;
UPDATE DISH_New SET NAME = TRIM('Coffee - Our Original Blend                                             ') WHERE ID = 454103	;
UPDATE DISH_New SET NAME = TRIM('Coffee - Our Original Blend                                             ') WHERE ID = 454104	;
UPDATE DISH_New SET NAME = TRIM('Buffet - Quality And The Best Obtainable                                ') WHERE ID = 454118	;
UPDATE DISH_New SET NAME = TRIM('Buffet - Quality And The Best Obtainable                                ') WHERE ID = 454119	;
UPDATE DISH_New SET NAME = TRIM('Buffet - Quality And The Best Obtainable                                ') WHERE ID = 454128	;
UPDATE DISH_New SET NAME = TRIM('Virgin Planters Punch- 1 Tsp                                            ') WHERE ID = 419657	;
UPDATE DISH_New SET NAME = TRIM('Virgin Planters Punch- 1 Tsp                                            ') WHERE ID = 419658	;
UPDATE DISH_New SET NAME = TRIM('Virgin Rum Julep                                                        ') WHERE ID = 419748	;
UPDATE DISH_New SET NAME = TRIM('Good Earth Tostada                                                      ') WHERE ID = 517739	;
UPDATE DISH_New SET NAME = TRIM('Good Earth Tostada                                                      ') WHERE ID = 490886	;


# @BEGIN UpdateDish_NewV1
# @IN Dish_NewV1 
# @PARAM last_appeared=currentYear_WHERE_last_appeared>currentYear
# @PARAM last_appeared=first_appeared_WHERE_last_appeared<first_appeared
# @PARAM first_appeared=currentYear_WHERE_first_appeared>currentYear


UPDATE Dish_New
SET last_appeared = first_appeared
WHERE last_appeared < first_appeared
;

UPDATE Dish_New
SET last_appeared = CAST(strftime('%Y', current_date) AS INTEGER)
where last_appeared > CAST(strftime('%Y', current_date) AS INTEGER)
;

UPDATE Dish_New
SET first_appeared = CAST(strftime('%Y', current_date) AS INTEGER)
where first_appeared > CAST(strftime('%Y', current_date) AS INTEGER)
;

SELECT 'Dish table fixed'
;

drop table IF EXISTS Menu_New 
;

# @OUT Dish_NewV2 
# @END UpdateDish_NewV1



# @BEGIN CreateMenu_New
# @IN Menu 
# @OUT Menu_New 
# @END CreateMenu_New

CREATE TABLE IF NOT EXISTS Menu_New 
(
  id INTEGER NOT NULL PRIMARY KEY, 
  name TEXT NULL,
  sponsor TEXT NULL,
  event TEXT NULL,
  venue TEXT NULL,
  place TEXT NULL,
  physical_description TEXT NULL,
  occasion TEXT NULL,
  notes TEXT NULL,
  call_number TEXT NULL,
  date date NULL,
  location TEXT NULL,
  currency TEXT NULL,
  currency_symbol TEXT NULL,
  status TEXT Not NULL,
  page_count INTEGER,
  dish_count INTEGER  
)
;

DELETE FROM Menu_New
;

INSERT INTO Menu_New 
SELECT 
 id
,NULLIF(name,'')
,NULLIF(sponsor,'')
,NULLIF(event,'')
,NULLIF(venue,'')
,NULLIF(place,'')
,NULLIF(physical_description,'')
,NULLIF(occasion,'')
,NULLIF(notes,'')
,NULLIF(call_number,'')
,date
,NULLIF(location,'')
,NULLIF(currency,'')
,NULLIF(currency_symbol,'')
,status
,page_count
,dish_count
FROM Menu
;





# @BEGIN FixMissingVals_Menu_New
# @IN Menu_New
# @PARAM sponsor_WHERE_Values_Are_Missing
# @PARAM name_WHERE_Values_Are_Missing

UPDATE Menu_New
Set Sponsor = '[Not Given]'
where 1=0
OR TRIM(sponsor) = '?'
OR TRIM(sponsor) = ''
;

UPDATE Menu_New
Set name = '[Not Given]'
where 1=0
OR TRIM(name) = '?'
OR TRIM(name) = ''
;

UPDATE Menu_New
Set Sponsor = name
where name is not null
and TRIM(sponsor) = '[Not Given]'
and TRIM(name) <> '[Not Given]'
;

UPDATE Menu_New
Set name = Sponsor 
where sponsor is not null
and COALESCE(TRIM(name), '[Not Given]') = '[Not Given]'
and TRIM(sponsor) <> '[Not Given]'
;

UPDATE Menu_New
Set name = location 
where location is not null
and TRIM(location) <> '[Not Given]'
and coalesce(TRIM(name) , '[Not Given]') = '[Not Given]'
;

UPDATE Menu_New
Set name = place
where place is not null
and TRIM(place) <> '[Not Given]'
and TRIM(place) <> '?'
and TRIM(place) <> ''
and coalesce(TRIM(name) , '[Not Given]') = '[Not Given]'
;

UPDATE Menu_New
Set name = '[Not Given]'
where name is null
;

UPDATE Menu_New
Set Sponsor = '[Not Given]'
where Sponsor is null
;

SELECT 'Menu Table fixed'
;



# @OUT Menu_NewV1 
# @END FixMissingVals_Menu_New

DROP TABLE IF EXISTS MenuPage_New
;




# @BEGIN CreateMenuPage_New
# @IN MenuPage 
# @OUT MenuPage_New 
# @END CreateMenuPage_New


CREATE TABLE IF NOT EXISTS MenuPage_New
(
        id INTEGER NOT NULL PRIMARY KEY, 	
        menu_id  INTEGER NOT NULL, 
        page_number INTEGER NOT NULL,
        image_id INTEGER NULL,
        full_height INTEGER NULL,
        full_width  INTEGER NULL,
        uuid TEXT NULL, 	
        FOREIGN KEY (menu_id) REFERENCES menu (id) 
)
;

DELETE FROM MenuPage_New
;

INSERT INTO MenuPage_New
SELECT
         id
        ,menu_id
        ,page_number
        ,NULLIF(image_id,'')
        ,NULLIF(full_height,'')
        ,NULLIF(full_width,'')
        ,uuid
FROM MenuPage
;


# @BEGIN UpdateMenuPage_New_PageNumber
# @IN MenuPage_New 
# @PARAM page_number_where_=-1




WITH X as
(
        select id, Row_Number() over (partition by menu_id order by id) new_page_id
        from menupage_new x where page_number = -1
)
Update menupage_new
SET Page_number = (select new_page_id from X where menupage_new.id = X.id)
where id in (select id from x)
;

SELECT 'MenuPage Table Fixed'
;


# @OUT MenuPage_NewV1 
# @END UpdateMenuPage_New_PageNumber



DROP TABLE IF EXISTS MenuItem_New
;


# @BEGIN CreateMenuItem_New
# @IN MenuItem 
# @OUT MenuItem_New 
# @END CreateMenuItem_New

CREATE TABLE IF NOT EXISTS MenuItem_New
(
        id INTEGER NOT NULL PRIMARY KEY, 	
        menu_page_id INTEGER NOT NULL, 
        price NUMERIC NULL,
        high_price NUMERIC NULL,
        dish_id	INTEGER NOT NULL,
        created_at Timestamp(0) NULL,
        updated_at Timestamp(0) NULL,	
        xpos NUMERIC NULL, 	
        ypos NUMERIC NULL,
        FOREIGN KEY (menu_page_id) REFERENCES menupage (id) ,
        FOREIGN KEY (dish_id) REFERENCES dish (id) 
)
;


INSERT INTO MenuItem_New
SELECT
         id
        ,menu_page_id
        ,NULLIF(price,'')
        ,NULLIF(high_price,'')
        ,CASE WHEN dish_id is null or dish_id = '' THEN -1 ELSE dish_id END
        ,created_at
        ,updated_at
        ,NULLIF(xpos,'')
        ,NULLIF(ypos,'')
FROM MenuItem
;



# @BEGIN UpdateMenuItem_New
# @IN MenuItem_New 
# @PARAM high_price_=_price_WHERE_price_>_high_price
# @PARAM high_price_=_price_WHERE_price_is_null
# @PARAM updated_at_=_created_at_WHERE_created_at_>_updated_at





UPDATE MenuItem_New
SET high_price = price
WHERE price > high_price
;

UPDATE MenuItem_New
SET updated_at = created_at
WHERE created_at > updated_at
;

UPDATE MenuItem_New
SET high_price = price
WHERE high_price is null
and price is not null
;

SELECT 'MenuItem Table Fixed'
;



# @OUT MenuItem_NewV1 
# @END CreateMenuItem_New




# @BEGIN ConsolidatingDishNames
# @IN Dish_NewV2
# @IN MenuItem_NewV1 

# @OUT Dish_NewV3
# @OUT MenuItem_NewV2 
# @END ConsolidatingDishNames


-- Consolidate Dish Names
DROP TABLE IF EXISTS Dish_Temp
;

CREATE TABLE IF NOT EXISTS Dish_Temp AS 
select  
          name 
        , id old_id 
        , min(id) over (partition by name order by id) new_id 
        , menus_appeared 
        , max(menus_appeared) over (partition by name ) new_menus_appeared 
        , times_appeared  
        , max(times_appeared) over (partition by name ) new_times_appeared  
        , first_appeared  
        , min(case when first_appeared = 0 then 9999 else first_appeared end) over (partition by name ) new_first_appeared  
        , last_appeared      
        , max(last_appeared) over (partition by name ) new_last_appeared   
        , lowest_price     
        , min(lowest_price) over (partition by name ) new_lowest_price   
        , highest_price     
        , max(highest_price) over (partition by name ) new_highest_price       
from Dish_New 
WHERE name not like '%"%' 
and name in 
( 
        select name from dish group by 1 having count(*) > 1 
)  
; 

SELECT 'Consolidating ' || Count(*) || ' Products (1/10)'
FROM
(
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name <'B' 
) X
;

WITH X as 
( 
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name <'B' 
) 
UPDATE MenuItem_New 
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id) 
where id IN (Select id from X) 
; 

--/*
SELECT 'Consolidating ' || Count(*) || ' Products (2/10)'
FROM
(
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name >='B'
        and D.name < 'D'
) X
;
--*/

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='B'
        and D.name < 'D'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

--/*
SELECT 'Consolidating ' || Count(*) || ' Products (3/10)'
FROM
(
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name >='D'
        and D.name < 'F'
) X
;

--*/


WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='D'
        and D.name < 'F'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

--/*
SELECT 'Consolidating ' || Count(*) || ' Products (4/10)'
FROM
(
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name >='F'
        and D.name < 'H'
) X
;
--*/

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='F'
        and D.name < 'H'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

--/*
SELECT 'Consolidating ' || Count(*) || ' Products (5/10)'
FROM
(
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name >='H'
        and D.name < 'K'
) X
;
--*/


WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='H'
        and D.name < 'K'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

--/*
SELECT 'Consolidating ' || Count(*) || ' Products (6/10)'
FROM
(
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name >='K'
        and D.name < 'M'
) X
;
--*/

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='K'
        and D.name < 'M'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

--/*
SELECT 'Consolidating ' || Count(*) || ' Products (7/10)'
FROM
(
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name >='M'
        and D.name < 'P'
) X
;
--*/

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='M'
        and D.name < 'P'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

--/*
SELECT 'Consolidating ' || Count(*) || ' Products (8/10)'
FROM
(
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name >='P'
        and D.name < 'S'
) X
;
--*/


WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='P'
        and D.name < 'S'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

--/*
SELECT 'Consolidating ' || Count(*) || ' Products (9/10)'
FROM
(
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name >='S'
        and D.name < 'W'
) X
;
--*/


WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='S'
        and D.name < 'W'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;

--/*
SELECT 'Consolidating ' || Count(*) || ' Products (10/10)'
FROM
(
        Select M.Id, old_id, new_id from Dish_Temp D 
        JOIN MenuItem_New M 
        On 1=1 
        AND M.Dish_Id = D.old_id 
        where D.name >='Z'
) X
;
--*/

WITH X as
(
        Select M.Id, old_id, new_id from Dish_Temp D
        JOIN MenuItem_New M
        On 1=1
        AND M.Dish_Id = D.old_id
        where D.name >='Z'
)
UPDATE MenuItem_New
SET dish_id = (select new_id from X where X.Old_Id = MenuItem_New.dish_id and X.Id = MenuItem_New.Id)
where id IN (Select id from X)
;



DELETE FROM Dish_New where Id in
(select old_id from Dish_Temp where old_id <> new_id)
;

DELETE FROM Dish_Temp where old_id <> new_id
;

WITH X as
(
        Select old_id, new_id, new_menus_appeared, new_times_appeared, new_first_appeared, new_last_appeared, new_lowest_price, new_highest_price 
        from Dish_Temp
)
UPDATE Dish_New
SET menus_appeared = (select new_menus_appeared from X where X.Old_Id = dish_New.id)
,times_appeared = (select new_times_appeared from X where X.Old_Id = dish_New.id)
,first_appeared = (select new_first_appeared from X where X.Old_Id = dish_New.id)
,last_appeared  = (select new_last_appeared  from X where X.Old_Id = dish_New.id)
,lowest_price   = (select new_lowest_price   from X where X.Old_Id = dish_New.id)
,highest_price  = (select new_highest_price  from X where X.Old_Id = dish_New.id)
where id in (Select old_id from X)
;

select 'Removing orphan entities'
;

DROP TABLE IF EXISTS DISH_Temp
;

# @BEGIN RemovingOrphanEntities

# @IN MenuItem_NewV2 
# @IN MenuPage_NewV1
# @PARAM MenuItem.dish_id
# @PARAM MenuItem.menu_page_id
# @PARAM MenuPage.menu_id

# @OUT MenuItem_NewV3 
# @OUT MenuPage_NewV2
# @END RemovingOrphanEntities



DELETE FROM MenuItem_New 
WHERE dish_id in (select dish_id from MenuItem_New 
where dish_id not in (select id from Dish_New)
)
;

DELETE FROM MenuPage_New WHERE menu_id in 
(select menu_id from MenuPage_New where menu_id 
not in (select id from Menu_New))
;


DELETE FROM MenuItem_New 
WHERE menu_page_id in 
(select menu_page_id from MenuItem_New where menu_page_id not in (select id from MenuPage_New))
;

select 'Fixing RI'
;






# @BEGIN FixingRefrentialIntegrityDish

# @IN Dish_NewV3 
# @PARAM times_appeared
# @PARAM menus_appeared
# @PARAM first_appeared
# @PARAM last_appeared
# @PARAM lowest_price

# @OUT Dish_NewV4 
# @END FixingRefrentialIntegrityDish


WITH X as
(
        select id, times
        from Dish_New
        inner join
        (
        select dish_id, count(dish_id) AS times
        from MenuItem_New
        Group By dish_id
     
        )
        on dish_id == id
        WHERE times != times_appeared
        
)
Update Dish_New
Set
        times_appeared  = (SELECT times from X where X.id = Dish_New.id)
WHERE id IN (Select id from X);

/*Correcting menus_appeared in Table Dish (Query Takes Longer)*/

WITH X as
(
        select id, menu_times
        from Dish_New
        inner join
        (
	        select dish_id, count(menu_id) AS menu_times 
	        from MenuItem_New 
	        inner join MenuPage_New 
	        on MenuItem_New.menu_page_id = MenuPage_New.id 
	        Group By dish_id
     
        )
        on dish_id == id
        WHERE menu_times != menus_appeared
)
Update Dish_New
Set
        menus_appeared  = (SELECT menu_times from X where X.id = Dish_New.id)
WHERE id IN (Select id from X);



/*Correcting first_appeared in Table Dish*/

WITH X as
(
        select id, strftime('%Y', minDate) AS newYear
        from Dish_New
        inner join
        (
	        Select dish_id, min(Menu_New.date) AS minDate
		from MenuItem_New 
		inner join MenuPage_New on MenuItem_New.menu_page_id = MenuPage_New.id 
		inner join Menu_New on MenuPage_New.menu_id == Menu_New.id 
		Group By dish_id
        )
        on dish_id == id
        WHERE strftime('%Y', minDate) != first_appeared
)
Update Dish_New
Set
        first_appeared  = (SELECT newYear from X where X.id = Dish_New.id)
WHERE id IN (Select id from X);


/*Correcting last_appeared in Table Dish*/ -- Corrected

WITH X as
(
        select id, strftime('%Y', maxDate) AS newYear
        from Dish_New
        inner join
        (
	    Select dish_id, max(Menu_New.date) AS maxDate
		from MenuItem_New 
		inner join MenuPage_New on MenuItem_New.menu_page_id = MenuPage_New.id 
		inner join Menu_New on MenuPage_New.menu_id == Menu_New.id 
		Group By dish_id
        )
        on dish_id == id
        WHERE strftime('%Y', maxDate) != last_appeared
)
Update Dish_New
Set
        last_appeared  = (SELECT newYear from X where X.id = Dish_New.id)
WHERE id IN (Select id from X);



/* Correcting lowest_price using minimum price from MenuItem for a Dish in Dish Table*/

WITH X as
(
select id, minPrice
from 
(
        select Dish_New.id AS id, Dish_New.lowest_price AS lowest_price,   
                min(MenuItem_New.price) AS minPrice 
        from Dish_New 
        inner join MenuItem_New 
        on Dish_New.id == MenuItem_New.dish_id Group By MenuItem_New.dish_id
) 
where minPrice != lowest_price
)
Update Dish_New
Set
        lowest_price  = (SELECT minPrice from X where X.id = Dish_New.id)
WHERE id IN (Select id from X);






# @BEGIN FixingRefrentialIntegrityMenuItem

# @IN MenuItem_NewV3 
# @PARAM high_price

# @OUT MenuItem_NewV4 
# @END FixingRefrentialIntegrityMenuItem


/* Correcting high_price in MenuItem (Query Takes Longer)*/

WITH X as
(
select id, price from MenuItem_New where high_price < price
)
Update MenuItem_New
Set
        high_price  = (SELECT price from X where X.id = MenuItem_New.id)
WHERE id IN (Select id from X);



# @BEGIN FixingRefrentialIntegrityMenu

# @IN Menu_NewV1 
# @PARAM dish_count
# @PARAM page_count


# @OUT Menu_NewV2 
# @END FixingRefrentialIntegrityMenu


/*Correcting Dish Count in Menu*/


WITH X as
(
        Select MenuID, items 
        from 
        (
                select Menu_New.id AS MenuID, count(MenuItem_New.id) AS items, dish_count 
                from Menu_New inner join MenuPage_New 
                on Menu_New.id == MenuPage_New.menu_id 
                inner join MenuItem_New 
                on MenuItem_New.menu_page_id == MenuPage_New.id Group By Menu_New.id
        ) 
        where items != dish_count
)
Update Menu_New
Set
        dish_count  = (SELECT items from X where X.MenuID = Menu_New.id)
WHERE id IN (Select MenuID from X)
;

/*Correcting Page Count in Menu*/

WITH X as
(
        Select MenuID, pages 
        from 
        (
                select Menu_New.id AS MenuID, count(menu_id) AS pages, page_count  
                from Menu_New inner join MenuPage_New 
                on Menu_New.id == MenuPage_New.Menu_id group by Menu_New.id
        ) where pages != page_count
)
Update Menu_New
Set
        page_count  = (SELECT pages from X where X.MenuID = Menu_New.id)
WHERE id IN (Select MenuID from X)
;


# @BEGIN SaveNYPL.db
# @IN Menu_NewV2 
# @IN MenuItem_NewV4
# @IN Dish_NewV4 
# @IN MenuPage_NewV2


# @OUT NYPL.db 

# @END SaveNYPL.db


.save DATA/NYPL.db


# @END SQLWorkflow

