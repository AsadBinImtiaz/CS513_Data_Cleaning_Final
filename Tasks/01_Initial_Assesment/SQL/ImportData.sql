DROP TABLE IF EXISTS Dish;
DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS MenuItem;
DROP TABLE IF EXISTS MenuPage;

.mode csv

.import Data/Dish.csv Dish

SELECT '   Dish file added, Total Dishes = ' || COUNT(*) AS Dish_Count FROM Dish;

.import Data/Menu.csv Menu

SELECT '   Menu file added, Total Menus = ' || COUNT(*) AS Menu_Count FROM Menu;

.import Data/MenuPage.csv MenuPage

SELECT '   MenuPage file added, Total MenuPages = ' || COUNT(*) AS MenuPage_Count FROM MenuPage;

.import Data/MenuItem.csv MenuItem

SELECT '   MenuItem file added, Total MenuItems = ' || COUNT(*) AS MenuItem_Count FROM MenuItem;
