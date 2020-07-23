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
