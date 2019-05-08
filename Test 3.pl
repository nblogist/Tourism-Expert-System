
(Region \='n')->
(
(Region='a')->findall(X,region(X,'Asia'),TList);
(Region='u')->findall(X,region(X,'USA'),TList);
(Region='e')->findall(X,region(X,'Europe'),TList);
(Region='b')->findall(X,region(X,'Arabia'),TList);
(Region='o')->findall(X,region(X,'Ocenia'),TList);
write()
),
write(TList).



(
(RoomType='s')->(TotalBudget is TotalBudget - (20*NumofDays));
(RoomType='t')->TotalBudget is TotalBudget - (40*NumofDays);
(RoomType='d')->TotalBudget is TotalBudget - (10*NumofDays);
(RoomType='q')->TotalBudget is TotalBudget - (50*NumofDays);
(RoomType='k')->TotalBudget is TotalBudget - (100*NumofDays);
write('Wrong RoomType')
),