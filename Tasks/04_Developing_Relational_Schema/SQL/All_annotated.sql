/* INCLUDE TERADATA SYNTAX, CHANGED FOR PERFORMANCE, MAY NOT WORK ON SQLLITE AS IS */

/*
# @begin NYPL_SQL_Workflow @desc Workflow for Cleaning NYPL dataset in SQL Lite
# @in  Dish.csv         @desc file://Data/Dish.csv
# @in  Menu.csv         @desc file://Data/Menu.csv
# @in  MenuItem.csv     @desc file://Data/MenuPage.csv
# @in  MenuPage.csv     @desc file://Data/MenuItem.csv
# @out Dish_out.csv     @desc file://Data/Dish.csv
# @out Menu_out.csv     @desc file://Data/Menu.csv
# @out MenuItem_out.csv @desc file://Data/MenuPage.csv
# @out MenuPage_out.csv @desc file://Data/MenuItem.csv
*/

DROP TABLE IF EXISTS Dish;
DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS MenuItem;
DROP TABLE IF EXISTS MenuPage;

DROP TABLE IF EXISTS Dish_Imp;
DROP TABLE IF EXISTS Menu_imp;
DROP TABLE IF EXISTS MenuItem_Imp;
DROP TABLE IF EXISTS MenuPage_Imp;

.mode csv

/*
# @begin Import_Dish_in_SQLLite @desc Import Dish.csv in SQLLite Dish table.
# @param Tools/SQLLite
# @param SQL/importdata.sh
# @in    Dish.csv     @desc file://Data/Dish.csv
# @out   Dish_Imp     @file sqllite://NYPL.db/Dish
*/

.import Data/Dish.csv Dish_Imp

SELECT '   Dish file added, Total Dishes = ' || COUNT(*) AS Dish_Count FROM Dish_Imp;

/*
# @end   Import_Dish_in_SQLLite
*/

/*
# @begin Import_Menu_in_SQLLite @desc Import Menu.csv in SQLLite Menu table.
# @param Tools/SQLLite
# @param SQL/importdata.sh
# @in    Menu.csv     @desc file://Data/Menu.csv
# @out   Menu_Imp     @file sqllite://NYPL.db/Menu
*/

.import Data/Menu.csv Menu_Imp

SELECT '   Menu file added, Total Menus = ' || COUNT(*) AS Menu_Count FROM Menu_Imp;

/*
# @end   Import_Menu_in_SQLLite
*/

/*
# @begin Import_MenuPage_in_SQLLite @desc Import MenuPage.csv in SQLLite MenuPage table.
# @param Tools/SQLLite
# @param SQL/importdata.sh
# @in    MenuPage.csv     @desc file://Data/MenuPage.csv
# @out   MenuPage_Imp     @file sqllite://NYPL.db/MenuPage
*/

.import Data/MenuPage.csv MenuPage_Imp

SELECT '   MenuPage file added, Total MenuPages = ' || COUNT(*) AS MenuPage_Count FROM MenuPage_Imp;

/*
# @end   Import_MenuPage_in_SQLLite
*/

/*
# @begin Import_MenuItem_in_SQLLite @desc Import MenuItem.csv in SQLLite MenuItem table.
# @param Tools/SQLLite
# @param SQL/importdata.sh
# @in    MenuItem.csv     @desc file://Data/MenuItem.csv
# @out   MenuItem_Imp     @file sqllite://NYPL.db/MenuItem
# @end   Import_MenuItem_in_SQLLite
*/

.import Data/MenuItem.csv MenuItem_Imp

SELECT '   MenuItem file added, Total MenuItems = ' || COUNT(*) AS MenuItem_Count FROM MenuItem_Imp;


/*
# @end   Import_MenuItem_in_SQLLite
*/

-- Cleaning DISH
/*
# @begin Fix_Dish_in_SQLLite @desc Fix Dish table in SQLLite\n * Truncate Dish names\n * Adjust FirstApperaed/LastAppeared.
# @param SQL/data.sql
# @in    Dish_Imp   @file sqllite://NYPL.db/Dish
# @out   Dish_clean @file sqllite://NYPL.db/Dish
*/

SELECT '    Truncating Dish Names Longer than 500 Characters'
;

UPDATE Dish_Imp SET NAME = TRIM('Nelson''S Blood (Cocktail)                                              ') WHERE ID = 402726	;
UPDATE Dish_Imp SET NAME = TRIM('Tio Pepe Sherry                                                         ') WHERE ID = 408306	;
UPDATE Dish_Imp SET NAME = TRIM('Our Game Plan                                                           ') WHERE ID = 417683	;
UPDATE Dish_Imp SET NAME = TRIM('Dessert - Gewurztraminer Hugel                                          ') WHERE ID = 418332	;
UPDATE Dish_Imp SET NAME = TRIM('Rijsttafel - The Rice-Table                                             ') WHERE ID = 418709	;
UPDATE Dish_Imp SET NAME = TRIM('Croissants Au Jambon - - A Crescent Pastry With Ham                     ') WHERE ID = 419261	;
UPDATE Dish_Imp SET NAME = TRIM('Souffle Grand Marnier, Les Petit Fours                                  ') WHERE ID = 419302	;
UPDATE Dish_Imp SET NAME = TRIM('The Wines By Gordon Bass                                                ') WHERE ID = 419313	;
UPDATE Dish_Imp SET NAME = TRIM('Dole De Sion - Grossenbacher (Dole Duh See-Ohn)                         ') WHERE ID = 419323	;
UPDATE Dish_Imp SET NAME = TRIM('Chateau Petrus 1959 - Chateau Bottled (Shah-Toe Peh-Trews)              ') WHERE ID = 419325	;
UPDATE Dish_Imp SET NAME = TRIM('Sylvaner From Alsace France                                             ') WHERE ID = 420659	;
UPDATE Dish_Imp SET NAME = TRIM('Club Breakfast No. 3                                                    ') WHERE ID = 421319	;
UPDATE Dish_Imp SET NAME = TRIM('Club Breakfast No. 4                                                    ') WHERE ID = 421340	;
UPDATE Dish_Imp SET NAME = TRIM('Club Breakfast No. 5                                                    ') WHERE ID = 421341	;
UPDATE Dish_Imp SET NAME = TRIM('Donahoe''S Farm Style Chicken Dinner                                    ') WHERE ID = 430379	;
UPDATE Dish_Imp SET NAME = TRIM('Hobeau''S Or Nodelini''S.                                               ') WHERE ID = 438468	;
UPDATE Dish_Imp SET NAME = TRIM('Hobeau''S Or Nodelini''S.                                               ') WHERE ID = 438470	;
UPDATE Dish_Imp SET NAME = TRIM('L''Appetite Vient En Mangeant                                           ') WHERE ID = 454063	;
UPDATE Dish_Imp SET NAME = TRIM('Patrons Meal                                                            ') WHERE ID = 454077	;
UPDATE Dish_Imp SET NAME = TRIM('Patrons Meal                                                            ') WHERE ID = 454078	;
UPDATE Dish_Imp SET NAME = TRIM('Patrons Meal                                                            ') WHERE ID = 454079	;
UPDATE Dish_Imp SET NAME = TRIM('A Teas Of Excellent Quality                                             ') WHERE ID = 454095	;
UPDATE Dish_Imp SET NAME = TRIM('A Teas Of Excellent Quality                                             ') WHERE ID = 454096	;
UPDATE Dish_Imp SET NAME = TRIM('Buffet - Quality And The Best Obtainable                                ') WHERE ID = 454140	;
UPDATE Dish_Imp SET NAME = TRIM('The Early Morn                                                          ') WHERE ID = 454154	;
UPDATE Dish_Imp SET NAME = TRIM('The Early Morn                                                          ') WHERE ID = 454155	;
UPDATE Dish_Imp SET NAME = TRIM('The Early Morn                                                          ') WHERE ID = 454156	;
UPDATE Dish_Imp SET NAME = TRIM('Zakuska - Hors D''Oeuvres                                               ') WHERE ID = 469753	;
UPDATE Dish_Imp SET NAME = TRIM('Tour D''Argent Of Paris                                                 ') WHERE ID = 469775	;
UPDATE Dish_Imp SET NAME = TRIM('Sydney Smith Afternoon Tea                                              ') WHERE ID = 471390	;
UPDATE Dish_Imp SET NAME = TRIM('Dual Purpose Buffet                                                     ') WHERE ID = 486297	;
UPDATE Dish_Imp SET NAME = TRIM('Broasted Chicken Ala Skillet Dinner                                     ') WHERE ID = 506183	;
UPDATE Dish_Imp SET NAME = TRIM('Peking Duck In The Great Tradition Of Chinese Haute Cuisine             ') WHERE ID = 514868	;
UPDATE Dish_Imp SET NAME = TRIM('Charcoal Broiled 1-Lb. Short Loin Steak                                 ') WHERE ID = 427545	;
UPDATE Dish_Imp SET NAME = TRIM('Souffle Grand Marnier, Les Petit Fours                                  ') WHERE ID = 419300	;
UPDATE Dish_Imp SET NAME = TRIM('The Early Morn                                                          ') WHERE ID = 454152	;
UPDATE Dish_Imp SET NAME = TRIM('The Early Morn                                                          ') WHERE ID = 454153	;
UPDATE Dish_Imp SET NAME = TRIM('Meal At The Sepasco Trail And King''S Highway                           ') WHERE ID = 486298	;
UPDATE Dish_Imp SET NAME = TRIM('Nelson''S Blood (Cocktail)                                              ') WHERE ID = 402723	;
UPDATE Dish_Imp SET NAME = TRIM('Beef And Cheese - Bonnes-Mares - 1959                                   ') WHERE ID = 418331	;
UPDATE Dish_Imp SET NAME = TRIM('Selle De Veau, Bouquetiere De Legumes                                   ') WHERE ID = 419279	;
UPDATE Dish_Imp SET NAME = TRIM('Charcoal Grilled Planked Steak Or Chicken Dinner                        ') WHERE ID = 430396	;
UPDATE Dish_Imp SET NAME = TRIM('British Airways Wines                                                   ') WHERE ID = 436648	;
UPDATE Dish_Imp SET NAME = TRIM('Buffet - Quality And The Best Obtainable                                ') WHERE ID = 454130	;
UPDATE Dish_Imp SET NAME = TRIM('Beware Of Fakirs                                                        ') WHERE ID = 454174	;
UPDATE Dish_Imp SET NAME = TRIM('Jake''S Fresh Sheet                                                     ') WHERE ID = 469646	;
UPDATE Dish_Imp SET NAME = TRIM('Jake''S Fresh Sheet                                                     ') WHERE ID = 469647	;
UPDATE Dish_Imp SET NAME = TRIM('Zakuska Of Fish                                                         ') WHERE ID = 469755	;
UPDATE Dish_Imp SET NAME = TRIM('Red Snapper Fillet On Salsify Sauce                                     ') WHERE ID = 469761	;
UPDATE Dish_Imp SET NAME = TRIM('Lamb 3 Ways                                                             ') WHERE ID = 469764	;
UPDATE Dish_Imp SET NAME = TRIM('Lamb 3 Ways                                                             ') WHERE ID = 469766	;
UPDATE Dish_Imp SET NAME = TRIM('Fallow Venison Medallion, A La Minute                                   ') WHERE ID = 469773	;
UPDATE Dish_Imp SET NAME = TRIM('Chateau De La Ragotiere 1992 To Accompany This Dish                     ') WHERE ID = 471365	;
UPDATE Dish_Imp SET NAME = TRIM('Autumn Applefest Breakfast                                              ') WHERE ID = 512916	;
UPDATE Dish_Imp SET NAME = TRIM('Clos Vougeot, 1961 (Louis Jadot - Estate Bottled)                       ') WHERE ID = 516524	;
UPDATE Dish_Imp SET NAME = TRIM('Bestimmte Stoffe                                                        ') WHERE ID = 517040	;
UPDATE Dish_Imp SET NAME = TRIM('e Have The Finest Vintages Available In Imported Wines                  ') WHERE ID = 417938	;
UPDATE Dish_Imp SET NAME = TRIM('Dezaley- 1964 - Grossenbacher (Day-Za-Lay)                              ') WHERE ID = 419311	;
UPDATE Dish_Imp SET NAME = TRIM('Pommery Brut 1961 - En Methusalems                                      ') WHERE ID = 419314	;
UPDATE Dish_Imp SET NAME = TRIM('Chateau D''Auvernier, Chateau Bottled Neuchatel (Shah-Toe Doh-Vern-Yerr)') WHERE ID = 419318	;
UPDATE Dish_Imp SET NAME = TRIM('Dole De Sion - Grossenbacher (Dole Duh See-Ohn)                         ') WHERE ID = 419321	;
UPDATE Dish_Imp SET NAME = TRIM('Club Breakfast No. 2                                                    ') WHERE ID = 421318	;
UPDATE Dish_Imp SET NAME = TRIM('Diamond-Back-Terrapin                                                   ') WHERE ID = 421850	;
UPDATE Dish_Imp SET NAME = TRIM('Fried Chicken - Negro Cooks                                             ') WHERE ID = 421853	;
UPDATE Dish_Imp SET NAME = TRIM('Chateaubriand Strasbourgeoise                                           ') WHERE ID = 427609	;
UPDATE Dish_Imp SET NAME = TRIM('Booze At D.B.                                                           ') WHERE ID = 428470	;
UPDATE Dish_Imp SET NAME = TRIM('Ain''T She Sweet                                                        ') WHERE ID = 428483	;
UPDATE Dish_Imp SET NAME = TRIM('From Our Charcoal Hearth                                                ') WHERE ID = 429473	;
UPDATE Dish_Imp SET NAME = TRIM('Lanson Black Label Champagne                                            ') WHERE ID = 436650	;
UPDATE Dish_Imp SET NAME = TRIM('J. Lohr Riverstone Chardonnay 1989                                      ') WHERE ID = 436655	;
UPDATE Dish_Imp SET NAME = TRIM('Festival Of The Season                                                  ') WHERE ID = 438463	;
UPDATE Dish_Imp SET NAME = TRIM('Coffee - Our Original Blend                                             ') WHERE ID = 454105	;
UPDATE Dish_Imp SET NAME = TRIM('Quilcene Opysters*, Jake''S Fresh Sheet                                 ') WHERE ID = 469642	;
UPDATE Dish_Imp SET NAME = TRIM('Portobello Mushroom And Le Seurre Baby Peas                             ') WHERE ID = 469756	;
UPDATE Dish_Imp SET NAME = TRIM('Lamb 3 Ways                                                             ') WHERE ID = 469762	;
UPDATE Dish_Imp SET NAME = TRIM('The Keller Family''S Special Steak                                      ') WHERE ID = 470642	;
UPDATE Dish_Imp SET NAME = TRIM('The Beekman Arms                                                        ') WHERE ID = 486296	;
UPDATE Dish_Imp SET NAME = TRIM('The Earth Burger. Vegetarian                                            ') WHERE ID = 490882	;
UPDATE Dish_Imp SET NAME = TRIM('The Earth Burger. Vegetarian                                            ') WHERE ID = 490883	;
UPDATE Dish_Imp SET NAME = TRIM('Barbecued Salmon: Done Indian Style                                     ') WHERE ID = 512180	;
UPDATE Dish_Imp SET NAME = TRIM('Barbecued Salmon: Done Indian Style                                     ') WHERE ID = 512181	;
UPDATE Dish_Imp SET NAME = TRIM('Bestimmte Stoffe                                                        ') WHERE ID = 517038	;
UPDATE Dish_Imp SET NAME = TRIM('Bestimmte Stoffe                                                        ') WHERE ID = 517039	;
UPDATE Dish_Imp SET NAME = TRIM('Bestimmte Stoffe                                                        ') WHERE ID = 517037	;
UPDATE Dish_Imp SET NAME = TRIM('Incomparable Crepe Ricardo - Dessert Supreme!                           ') WHERE ID = 517202	;
UPDATE Dish_Imp SET NAME = TRIM('Chateau Cheval Blanc, 1961 (Chateau Bottled)                            ') WHERE ID = 516523	;
UPDATE Dish_Imp SET NAME = TRIM('Breaded Veal Parmigiana, Tender Veal Breaded                            ') WHERE ID = 504229	;
UPDATE Dish_Imp SET NAME = TRIM('Breaded Veal Parmigiana, Tender Veal Breaded                            ') WHERE ID = 504230	;
UPDATE Dish_Imp SET NAME = TRIM('All Entrees Served With Choice Of Potato, Breads, Butter                ') WHERE ID = 470664	;
UPDATE Dish_Imp SET NAME = TRIM('All Entrees Served With Choice Of Potato, Breads, Butter                ') WHERE ID = 470665	;
UPDATE Dish_Imp SET NAME = TRIM('Baked Lasagne, Wide Egg Noodle                                          ') WHERE ID = 504227	;
UPDATE Dish_Imp SET NAME = TRIM('Baked Lasagne, Wide Egg Noodle                                          ') WHERE ID = 504228	;
UPDATE Dish_Imp SET NAME = TRIM('Beware Of Fakirs                                                        ') WHERE ID = 454169	;
UPDATE Dish_Imp SET NAME = TRIM('Beware Of Fakirs                                                        ') WHERE ID = 454170	;
UPDATE Dish_Imp SET NAME = TRIM('Coffee - Our Original Blend                                             ') WHERE ID = 454103	;
UPDATE Dish_Imp SET NAME = TRIM('Coffee - Our Original Blend                                             ') WHERE ID = 454104	;
UPDATE Dish_Imp SET NAME = TRIM('Buffet - Quality And The Best Obtainable                                ') WHERE ID = 454118	;
UPDATE Dish_Imp SET NAME = TRIM('Buffet - Quality And The Best Obtainable                                ') WHERE ID = 454119	;
UPDATE Dish_Imp SET NAME = TRIM('Buffet - Quality And The Best Obtainable                                ') WHERE ID = 454128	;
UPDATE Dish_Imp SET NAME = TRIM('Virgin Planters Punch- 1 Tsp                                            ') WHERE ID = 419657	;
UPDATE Dish_Imp SET NAME = TRIM('Virgin Planters Punch- 1 Tsp                                            ') WHERE ID = 419658	;
UPDATE Dish_Imp SET NAME = TRIM('Virgin Rum Julep                                                        ') WHERE ID = 419748	;
UPDATE Dish_Imp SET NAME = TRIM('Good Earth Tostada                                                      ') WHERE ID = 517739	;
UPDATE Dish_Imp SET NAME = TRIM('Good Earth Tostada                                                      ') WHERE ID = 490886	;

Select '    Correct Dishes where last_appeared < first_appeared: 6 rows affected';

UPDATE Dish_Imp
SET last_appeared = first_appeared
WHERE last_appeared < first_appeared
;


Select '    Correct Dishes where last_appeared > Current Date  : 179 rows affected';
Select '    Correct Dishes where first_appeared > Current Date : 11 rows affected';

UPDATE Dish_Imp
SET   last_appeared = CAST(EXTRACT( YEAR FROM CURRENT_DATE) AS INTEGER)
WHERE last_appeared > CAST(EXTRACT( YEAR FROM CURRENT_DATE) AS INTEGER)

UPDATE Dish_Imp
SET first_appeared  = CAST(EXTRACT( YEAR FROM CURRENT_DATE) AS INTEGER)
WHERE first_appeared > CAST(EXTRACT( YEAR FROM CURRENT_DATE) AS INTEGER)
;

UPDATE Dish_Imp SET Lowest_Price = -1 WHERE Lowest_Price IS NULL;
UPDATE Dish_Imp SET Highest_Price = -1 WHERE Highest_Price IS NULL;

DROP TABLE IF EXISTS Dish_Clean 
;

/* TERADATA SYNTAX */
CREATE TABLE IF NOT EXISTS Dish_Clean 
	id 		        INTEGER NOT NULL, 
	Name            VARCHAR(500) NOT NULL CHARACTER SET UNICODE, 
	menus_appeared 	INTEGER NOT NULL,  
	times_appeared 	INTEGER NOT NULL,  
	first_appeared 	INTEGER NOT NULL,  
	last_appeared  	INTEGER NOT NULL,  
	lowest_price 	DECIMAL(18,2) NOT NULL, 
    highest_price 	DECIMAL(18,2) NOT NULL
)
UNIQUE PRIMARY INDEX (id)
;

DELETE FROM Dish_Clean
;

INSERT INTO Dish_Clean 
SELECT 
         id
        ,name 
        ,menus_appeared
        ,times_appeared
        ,first_appeared
        ,last_appeared
        ,lowest_price
        ,highest_price
FROM DISH
;

DROP TABLE DISH_IMP
;

DROP TABLE IF EXISTS DISH
;
CREATE TABLE DISH AS DISH_Clean WITH DATA
;

/*
# @end   Fix_Dish_in_SQLLite
*/

SELECT '  * Dish table corrected'
;

/*
# @begin Fix_Menu_in_SQLLite @desc Fix Menu table in SQLLite\n * Correct Invalid Characters\n * Adjust Counts.
# @param SQL/menu.sql
# @in    Menu_Imp   @file sqllite://NYPL.db/Menu
# @out   Menu_clean @file sqllite://NYPL.db/Menu
*/

UPDATE Menu_Imp SET sponsor = OREPLACE(OREPLACE(OREPLACE(OREPLACE(sponsor,'""""','"'),'\',''),'""','"'),'"',''); --'
UPDATE Menu_Imp SET event = OREPLACE(OREPLACE(OREPLACE(OREPLACE(event,'""""','"'),'\',''),'""','"'),'"','');     --'
UPDATE Menu_Imp SET venue = OREPLACE(OREPLACE(OREPLACE(OREPLACE(venue,'""""','"'),'\',''),'""','"'),'"','');     --'
UPDATE Menu_Imp SET place = OREPLACE(OREPLACE(OREPLACE(OREPLACE(place,'""""','"'),'\',''),'""','"'),'"','');     --'
UPDATE Menu_Imp SET physical_description = OREPLACE(OREPLACE(OREPLACE(OREPLACE(physical_description,'""""','"'),'\',''),'""','"'),'"',''); --'
UPDATE Menu_Imp SET occasion = OREPLACE(OREPLACE(OREPLACE(OREPLACE(occasion,'""""','"'),'\',''),'""','"'),'"',''); --'
UPDATE Menu_Imp SET notes = OREPLACE(OREPLACE(OREPLACE(OREPLACE(notes,'""""','"'),'\',''),'""','"'),'"',''); --'

Select '    Correct Invalid characters in Menu                 : 179 rows affected';

UPDATE Menu_Imp
SET Sponsor = '[Not Given]'
WHERE 1=0
OR TRIM(sponsor) = '?'
OR TRIM(sponsor) = ''
;

UPDATE Menu_Imp
SET NAME = '[Not Given]'
WHERE 1=0
OR TRIM(NAME) = '?'
OR TRIM(NAME) = ''
;

UPDATE Menu_Imp
SET Sponsor = NAME
WHERE NAME IS NOT NULL
AND TRIM(sponsor) = '[Not Given]'
AND TRIM(NAME) <> '[Not Given]'
;

UPDATE Menu_Imp
SET NAME = Sponsor 
WHERE sponsor IS NOT NULL
AND COALESCE(TRIM(NAME), '[Not Given]') = '[Not Given]'
AND TRIM(sponsor) <> '[Not Given]'
;

UPDATE Menu_Imp
SET NAME = location 
WHERE location IS NOT NULL
AND TRIM(location) <> '[Not Given]'
AND COALESCE(TRIM(NAME) , '[Not Given]') = '[Not Given]'
;

UPDATE Menu_Imp
SET NAME = place
WHERE place IS NOT NULL
AND TRIM(place) <> '[Not Given]'
AND TRIM(place) <> '?'
AND TRIM(place) <> ''
AND COALESCE(TRIM(NAME) , '[Not Given]') = '[Not Given]'
;

UPDATE Menu_Imp
SET NAME = '[Not Given]'
WHERE NAME IS NULL
;

UPDATE Menu_Imp
SET Sponsor = '[Not Given]'
WHERE Sponsor IS NULL
;

DROP TABLE IF EXISTS Menu_Clean
;

/* TERADATA SYNTAX */
CREATE TABLE Menu_Clean 
(
	id 		INTEGER NOT NULL, 
	"Name" 	VARCHAR(300), 
	sponsor VARCHAR(150), 
	event VARCHAR(200), 
	venue VARCHAR(50), 
	place VARCHAR(120), 
	physical_description VARCHAR(120), 
	occasion VARCHAR(100), 
	notes VARCHAR(300), 
	call_number VARCHAR(10), 
	Menu_DATE DATE, 
	location VARCHAR(500), 
	currency VARCHAR(25), 
	currency_symbol VARCHAR(5), 
	status VARCHAR(15) NOT NULL, 
	page_count INTEGER, 
	dish_count INTEGER
)
UNIQUE PRIMARY INDEX (id)
;

INSERT INTO MENU_Clean SELECT * FROM MENU_IMP
;

DROP TABLE MENU_IMP;

DROP TABLE IF EXISTS MENU
;
CREATE TABLE Menu AS MENU_Clean WITH DATA
;

/*
# @end   Fix_Menu_in_SQLLite
*/

Select '  * Menu Table Corrected';

/*
# @begin Fix_MenuPage_in_SQLLite @desc Fix MenuPage table in SQLLite\n * Adjust page number sequences.
# @param SQL/menupage.sql
# @in    MenuPage_Imp   @file sqllite://NYPL.db/MenuPage
# @out   MenuPage_clean @file sqllite://NYPL.db/MenuPage
*/

Select '    MenuPage.pagenumbers resequenced                   : 175 rows affected';  


UPDATE MenuPage_Imp
FROM 
(
        SELECT id Src_Id, page_number, ROW_NUMBER() OVER (PARTITION BY menu_id ORDER BY id) new_page_id
        FROM MenuPage_Imp x WHERE COALESCE(page_number,-1) = -1
		
) X
SET Page_number = X.new_page_id
WHERE id = X.Src_Id
;

DROP TABLE IF EXISTS MenuPage_Clean
;

CREATE TABLE MenuPage_Clean 
(
	id INTEGER NOT NULL, 
	menu_id INTEGER NOT NULL, 
	page_number INTEGER NOT NULL, 
	image_id INTEGER, 
	full_height INTEGER	, 
	full_width INTEGER	, 
	uuid VARCHAR(50)
)
UNIQUE PRIMARY INDEX (id)
;

INSERT INTO MenuPage_Clean SELECT * FROM MenuPage_Imp;

DROP TABLE MenuPage_Imp;

DROP TABLE IF EXISTS MenuPage
;
CREATE TABLE MenuPage AS MenuPage_Clean WITH DATA
;


/*
# @end   Fix_MenuPage_in_SQLLite
*/

Select '  * MenuPage Table Corrected';

/*
# @begin Fix_MenuItem_in_SQLLite @desc Fix MenuItem table in SQLLite\n * Adjust created/updated times \n * Adjust Counts.
# @param SQL/menuitem.sql
# @in    MenuItem_Imp   @file sqllite://NYPL.db/MenuItem
# @out   MenuItem_clean @file sqllite://NYPL.db/MenuItem
*/

Select '    Correcting price > high_price                      : 2378 rows affected';
Select '    Correcting created_at > updated_at                 : 2874 rows affected';


UPDATE MenuItem_Imp
SET high_price = price
WHERE price > high_price
;

UPDATE MenuItem_Imp
SET updated_at = created_at
WHERE created_at > updated_at
;

UPDATE MenuItem_Imp
SET high_price = price
WHERE high_price IS NULL
AND price IS NOT NULL
;

RENAME TABLE MenuItem_Imp AS MenuItem_Clean
;

DROP TABLE IF EXISTS MenuItem
;
CREATE TABLE MenuItem AS MenuItem_Clean WITH DATA
;

/*
# @end   Fix_MenuItem_in_SQLLite
*/

Select '  * MenuItem Table Corrected';


/*
Consolated cleanup
*/

/*
# @begin Consolidate_Records @desc Consolidate Dish/MenuItem/Menupage table in SQLLite\n Merge records with same Ids.
# @param SQL/all.sql
# @in    MenuPage_clean @file sqllite://NYPL.db/MenuPage
# @in    Dish_clean     @file sqllite://NYPL.db/Dish
# @in    MenuItem_clean @file sqllite://NYPL.db/MenuItem
# @out   MenuPage       @file sqllite://NYPL.db/MenuPage
# @out   MenuItem       @file sqllite://NYPL.db/MenuItem
# @out   Dish           @file sqllite://NYPL.db/Dish
*/

Select '    Consolidating dishes                               : 36701 rows affected';
Select '    Consolidating MeniItems                            : 23371 rows affected';

DELETE FROM DISH ALL;
INSERT INTO DISH SELECT * FROM DISH_CLEAN;
DELETE FROM MENU ALL;
INSERT INTO MENU SELECT * FROM MENU_CLEAN;
DELETE FROM MENUPAGE ALL;
INSERT INTO MENUPAGE SELECT * FROM MENUPAGE_CLEAN;
DELETE FROM MENUITEM ALL;
INSERT INTO MENUITEM SELECT * FROM MENUITEM_CLEAN;

/* TERADATA SYNTAX */
CREATE VOLATILE TABLE Dish_Temp AS 
(
SELECT  
          NAME 
        , id old_id 
        , MIN(id) OVER (PARTITION BY NAME ORDER BY id) new_id 
        , menus_appeared 
        , MAX(menus_appeared) OVER (PARTITION BY NAME ) new_menus_appeared 
        , times_appeared  
        , MAX(times_appeared) OVER (PARTITION BY NAME ) new_times_appeared  
        , first_appeared  
        , COALESCE(MIN(CASE WHEN first_appeared <= 1900 THEN NULL ELSE first_appeared end) OVER (PARTITION BY NAME ),1900) new_first_appeared  
        , last_appeared      
        , COALESCE(MAX(CASE WHEN last_appeared <= 1900 THEN NULL ELSE last_appeared END) OVER (PARTITION BY NAME ),new_first_appeared  ) new_last_appeared   
        , lowest_price     
        , COALESCE(MIN(CASE WHEN lowest_price <= 0 THEN NULL ELSE lowest_price END) OVER (PARTITION BY NAME ),-1.00) new_lowest_price   
        , highest_price     
        , COALESCE(MAX(CASE WHEN highest_price <= 0 THEN NULL ELSE highest_price END) OVER (PARTITION BY NAME ),new_lowest_price) new_highest_price       
FROM Dish
WHERE NAME NOT LIKE '%"%' 
AND NAME IN 
( 
        SELECT NAME FROM dish GROUP BY 1 HAVING COUNT(*) > 1 
)
)
WITH DATA
ON COMMIT PRESERVE ROWS
; 

UPDATE MenuItem 
FROM 
(
		SELECT M.Id MID, old_id, new_id 
		FROM Dish_Temp D
        JOIN MenuItem M
        ON 1=1
        AND M.Dish_Id = D.old_id        
) X
SET dish_id = X.new_id
WHERE id = X.MID
; 


DELETE FROM Dish WHERE Id IN
(SELECT old_id FROM Dish_Temp WHERE old_id <> new_id)
;


UPDATE Dish FROM Dish_Temp X
SET menus_appeared = new_menus_appeared
,times_appeared = new_times_appeared
,first_appeared = new_first_appeared
,last_appeared  = new_last_appeared
,lowest_price   = new_lowest_price 
,highest_price  = new_highest_price
WHERE id = X.old_id;


DELETE FROM MenuItem 
WHERE dish_id IN (SELECT dish_id FROM MenuItem 
WHERE dish_id NOT IN (SELECT id FROM Dish)
)
;

/*
# @end   Consolidate_Records
*/

Select '    Fixing RI in MenuPage';

/*
# @begin Fix_RI @desc Fix RI Dish/Menu/Menupage.MenuItem table in SQLLite\n Enforce RI constraints.
# @param SQL/all.sql
# @in    MenuPage_clean @file sqllite://NYPL.db/MenuPage
# @in    Dish_clean     @file sqllite://NYPL.db/Dish
# @in    Menu_clean     @file sqllite://NYPL.db/Menu
# @in    MenuItem_clean @file sqllite://NYPL.db/MenuItem
# @out   MenuPage       @file sqllite://NYPL.db/MenuPage
# @out   MenuItem       @file sqllite://NYPL.db/MenuItem
# @out   Menu           @file sqllite://NYPL.db/Menu
# @out   Dish           @file sqllite://NYPL.db/Dish
*/


DELETE FROM MenuPage WHERE menu_id NOT IN (SELECT id FROM Menu);
DELETE FROM MenuItem WHERE menu_page_id NOT IN (SELECT id FROM MenuPage);
DELETE FROM MenuItem WHERE dish_id NOT IN (SELECT id FROM dish);

Select '    Updating Dish times appeared                       : 21693 rows affected';

UPDATE Dish
FROM 
(
        SELECT D.id Src_Id, D.times_appeared, Count(M.id) times
        FROM Dish D
        INNER JOIN MenuItem M
        ON 1=1
	AND  M.dish_id = D.id
	Group by 1,2
	Having times <> D.Times_Appeared
) X
SET
        times_appeared  = times
WHERE id = Src_Id
;

Select '    Updating Dish menus appeared                       : 28843 rows affected';

/*Correcting menus_appeared in Table Dish (Query Takes Longer)*/

UPDATE Dish
FROM 
(
        SELECT D.id Src_Id, D.menus_appeared, Count(distinct MP.Menu_id) menu_times
        FROM Dish D
        INNER JOIN MenuItem M
        ON 1=1
	AND  M.dish_id = D.id
	INNER JOIN MenuPage MP
        ON 1=1
	AND  MP.id = M.menu_page_id	
	Group by 1,2
	Having menu_times <> D.menus_Appeared
) X
SET
        menus_appeared  = menu_times
WHERE id = Src_ID
;



/*Correcting first_appeared in Table Dish*/
Select '    Updating Dish first appeared                       : 25272 rows affected';

UPDATE Dish
FROM
(
        SELECT dish.id Src_Id, dish.first_appeared, MIN(Extract(YEAR FROM Menu_DATE)) AS minDate
	FROM Dish
	inner Join MenuItem on MenuItem.dish_id = Dish.id 
	INNER JOIN MenuPage ON MenuItem.menu_page_id = MenuPage.id 
	INNER JOIN Menu ON MenuPage.menu_id = Menu.id 
	WHERE Menu_DATE IS NOT NULL
	GROUP BY 1,2
	having dish.first_appeared <> minDate
) X
SET
        first_appeared  = minDate
WHERE id = Src_Id
;


Select '    Updating Dish last appeared                        : 17857 rows affected';

UPDATE Dish
FROM
(
        SELECT dish.id Src_Id, dish.last_appeared, Max(Extract(YEAR FROM Menu_DATE)) AS minDate
	FROM Dish
	inner Join MenuItem on MenuItem.dish_id = Dish.id 
	INNER JOIN MenuPage ON MenuItem.menu_page_id = MenuPage.id 
	INNER JOIN Menu ON MenuPage.menu_id = Menu.id 
	WHERE Menu_DATE IS NOT NULL
	GROUP BY 1,2
	having dish.last_appeared <> minDate
) X
SET
        last_appeared  = minDate
WHERE id = Src_Id
;

/*
# @end   Fix_RI
*/

UPDATE DISH 
SET first_appeared = 1900 WHERE COALESCE(first_appeared,0) <= 0;

UPDATE DISH 
SET last_appeared = first_appeared WHERE COALESCE(last_appeared,0) < first_appeared;

/*
# @begin Consolidate_Dates @desc Consolidate Dish/Menu/Menupage table in SQLLite\n Adjust date intervals.
# @param SQL/all.sql
# @in    MenuPage_clean @file sqllite://NYPL.db/MenuPage
# @in    Dish_clean     @file sqllite://NYPL.db/Dish
# @in    Menu_clean     @file sqllite://NYPL.db/Menu
# @out   MenuPage       @file sqllite://NYPL.db/MenuPage
# @out   Menu           @file sqllite://NYPL.db/Menu
# @out   Dish           @file sqllite://NYPL.db/Dish
*/

Select '    Updating Dish prices                               : 20897 rows affected'
;

UPDATE Dish
FROM
(
	SELECT id Src_Id, lowest_price, minPrice
	FROM 
	(
	        SELECT 
				D.id AS id, 
				D.lowest_price AS lowest_price,   
	            MIN(M.price) AS minPrice 
	        FROM Dish D 
	        INNER JOIN MenuItem M
	        ON D.id = M.dish_id 
			GROUP BY 1,2
	) X 
	WHERE 
	(
		minPrice < lowest_price
		OR
		(minPrice > lowest_price AND lowest_price = 0)
	)
	AND minPrice IS NOT NULL
) X
SET
        lowest_price  = minPrice
WHERE id = Src_Id;



/*Correcting Dish Count in Menu*/

Select '    Updating Dish counts                               : 82967 rows affected';

UPDATE Menu
FROM
(
        SELECT MenuID, items 
        FROM 
        (
                SELECT M.id AS MenuID, dish_count, COUNT(MI.id) AS items 
                FROM Menu M
				INNER JOIN MenuPage MP 
                ON M.id = MP.menu_id 
                INNER JOIN MenuItem MI 
                ON MI.menu_page_id = MP.id 
				GROUP BY 1,2
        ) X
        WHERE items <> dish_count
) X
SET
        dish_count  = items
WHERE id = MenuID
;

Select '    Updating Dish Page counts                          : 214 rows affected';

/*Correcting Page Count in Menu*/

UPDATE Menu
FROM
(
        SELECT MenuID, pages , page_count
        FROM 
        (
                SELECT M.id AS MenuID, COUNT(MP.menu_id) AS pages, page_count  
                FROM Menu M
				INNER JOIN MenuPage MP 
                ON M.id = MP.Menu_id 
				GROUP BY 1,3
				
        ) X
		WHERE pages <> page_count
		
) X
SET
        page_count  = X.Pages
WHERE id = X.MenuId
;

UPDATE MenuItem
SET price = high_price
WHERE COALESCE(price,-1) = -1
AND COALESCE(high_price,-1) <> -1
;

UPDATE MenuItem
FROM
(
        SELECT m.id Src_id, m.price old_price, d.lowest_price, d.highest_price, ROUND((d.lowest_price + d.highest_price)/2,2) Src_price
        FROM MenuItem m
        JOIN Dish d
        ON m.dish_id = d.id
        WHERE 1=1
		AND COALESCE(m.price,0) <= 0
        AND COALESCE(d.lowest_price,0) > 0
        AND COALESCE(d.highest_price,0) > 0
		
) X
SET price = Src_Price
WHERE id = Src_Id
;
        
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






/* Correcting high_price in MenuItem (Query Takes Longer)*/

UPDATE MenuItem
FROM
(
SELECT id Src_Id, price Src_Price FROM MenuItem WHERE COALESCE(high_price,-1) < price
)
X
SET
        high_price  = price
WHERE id = Src_Id
;

UPDATE MenuItem
FROM
(
        SELECT
                M.id Src_Id, M.high_price, M.Dish_Id, Max_Price 
        FROM    MenuItem M
        JOIN
        (
                SELECT dish_id, MAX(price) Max_Price 
                FROM MenuItem    
                WHERE price IS NOT NULL
                GROUP BY 1                
        ) D
        ON M.Dish_Id = D.Dish_ID
        WHERE 1=1
        AND   COALESCE(Max_Price,0) > 0
        AND   COALESCE(m.high_price,-1) = -1
        GROUP BY 1,2,3,4
       
)
X
SET
        high_price  = Max_Price
WHERE id = Src_Id
;

UPDATE MenuItem
FROM
(
        SELECT
                M.id Src_Id, M.price, M.Dish_Id, Max_Price 
        FROM    MenuItem M
        JOIN
        (
                SELECT dish_id, MIN(price) Max_Price 
                FROM MenuItem    
                WHERE price IS NOT NULL
                GROUP BY 1                
        ) D
        ON M.Dish_Id = D.Dish_ID
        WHERE 1=1
        AND   COALESCE(Max_Price,0) > 0
        AND   COALESCE(m.price,-1) = -1
        GROUP BY 1,2,3,4
       
)
X
SET
        price  = Max_Price
WHERE id = Src_Id
;

UPDATE MenuItem
SET high_price = Price
WHERE high_price < Price
;

UPDATE MenuItem
SET price = high_Price
WHERE Price IS NULL
AND high_price IS NOT NULL
;

/*
# @end   Consolidate_Dates
*/

Select '  * All Data Corrected with SQL-Lite'
;
Select '  * SQL-Lite DB Exported'
;

.save DATA/NYPL.db

/*
# @begin Export_dish_table_from_SQLLite @desc Export SQLLite dish table to csv.
# @param SQLLite
# @param SQL/exportdata.sh
# @in    Dish          @desc sqllite://NYPL.db/Dish
# @out   Dish_out.csv  @file file://Data/Dish.csv
*/
.export Dish Data/Dish.csv
/*
# @end   Export_dish_table_from_SQLLitee

# @begin Export_menu_table_from_SQLLite @desc Export SQLLite menu table to csv.
# @param SQLLite
# @param SQL/exportdata.sh
# @in    Menu          @desc sqllite://NYPL.db/Menu
# @out   Menu_out.csv  @file file://Data/Menu.csv
*/
.export Menu Data/Menu.csv
/*
# @end   Export_menu_table_from_SQLLitee

# @begin Export_menuitem_table_from_SQLLite @desc Export SQLLite menuitem table to csv.
# @param SQLLite
# @param SQL/exportdata.sh
# @in    MenuItem          @desc sqllite://NYPL.db/MenuItem
# @out   MenuItem_out.csv  @file file://Data/MenuItem.csv
*/
.export MenuItem Data/MenuItem.csv
/*
# @end   Export_menuitem_table_from_SQLLitee

# @begin Export_menupage_table_from_SQLLite @desc Export SQLLite menupage table to csv.
# @param SQLLite
# @param SQL/exportdata.sh
# @in    MenuPage          @desc sqllite://NYPL.db/MenuPage
# @out   MenuPage_out.csv  @file file://Data/MenuPage.csv
*/
.export MenuPage Data/MenuPage.csv
/*
# @end   Export_menupage_table_from_SQLLitee
*/

/*
# @END SQLWorkflow
*/
