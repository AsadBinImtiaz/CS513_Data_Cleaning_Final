







process(menu_file, replacenan, menu_file2).
process(menu_file2, replaceand, menu_file3).
process(menu_file3, csvtosql, nypl_db).

process(menupage_file, fillna, menupage_file2).
process(menupage_file2, replaceps_rbk, menupage_file3).
process(menupage_file3, csvtosql, nypl_db).


process(menuitem_file, fillna, menuitem_file2).
process(menuitem_file2, replacenan, menuitem_file3).
process(menuitem_file3, rstriputc, menuitem_file4).
process(menuitem_file3, csvtosql, nypl_db).

process(dish_file, replaceand, dish_file2).
process(dish_file2, csvtosql, nypl_db).


process(nypl_db, copytable, dish_new).
process(nypl_db, copytable, menu_new).
process(nypl_db, copytable, menuitem_new).
process(nypl_db, copytable, menupage_new).


process(dish_new, updatedish, dish_new1).
process(menu_new, updatemenu, menu_new1).
process(menuitem_new, updatemenuitem, menuitem_new1).
process(menupage_new, updatemenupage, menupage_new1).


process(menuitem_new1, updatedishmenuitembyjoin, menuitem_new2).
process(dish_new1, updatedishmenuitembyjoin, dish_new2).




links(X, Y, Z) :- process(X, Y, Z).
links(V, W, Z) :- process(X, Y, Z), links(V, W, X). 


outputdependentprocess(Y) :- links(X, Y, menuitem_file4).

outputdependentfiles(X) :- links(X, Y, menuitem_file4).

