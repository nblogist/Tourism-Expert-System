write('Do you have a specific region in mind? Y/N'), read(YN),
(YN=='y')->(write('
Enter A for Asia; 
U for The United States; 
E for Europe; 
B for Arabia; 
O for Oceania: '),nl,nl,
read(Region);Region='n')

write('What do you prefer? 
s for Single Bed Room; 
t for Twin Bed Room; 
d for Dorm Rooms; 
q for Queen Room; 
k for King Room '),nl,nl,
read(RoomType),
write(RoomType),
(
(RoomType='s')->TotalBudget is TotalBudget - (20*NumofDays);
(RoomType='t')->TotalBudget is TotalBudget - (40*NumofDays);
(RoomType='d')->TotalBudget is TotalBudget - (10*NumofDays);
(RoomType='q')->TotalBudget is TotalBudget - (50*NumofDays);
(RoomType='k')->TotalBudget is TotalBudget - (100*NumofDays);
write('Wrong RoomType')
),
%SEPARATION ON BUDGET
Temp_budget is TotalBudget/NumofPeople,
Final_budget is Temp_budget/NumofDays,
write('Your Final Budget per Person per Day is (Room Cost included):'),nl,nl,
write(Final_budget),
findall(X, (cost(X,Y),Y=<Final_budget), BudgetList), 
write('List of Possible Cities'),nl,nl,
write(BudgetList),nl,nl,

%SEPARATION ON REGION
(YN == 'y')->
(
(Region='a')->findall(X,region(X,'Asia'),RegionList);
(Region='u')->findall(X,region(X,'USA'),RegionList);
(Region='e')->findall(X,region(X,'Europe'),RegionList);
(Region='b')->findall(X,region(X,'Arabia'),RegionList);
(Region='o')->findall(X,region(X,'Ocenia'),RegionList);
write()
),
write('REGIONLIST'),
write(RegionList),nl,nl,nl,

%SEPARATION ON FOODIE
(NumofFood>5)->findall(X,food(X),FoodList),
write('FoodList'),
write(FoodList),nl,nl,nl,

%SEPARATION ON TimeofTravel
(TimeofTravel='n')->findall(X,nightLife(X),NightList),
write('NightList'),
write(NightList),nl,nl,nl,

inter(BudgetList, RegionList, X1),
inter(X1, FoodList, X2),
inter(X2, NightList, X3),
write('FINAL LIST'),nl,nl
write(X3)
%SEPARATION ON WEATHER
(Temp='c')->findall(X,weather(X,'C'),WeatherList),
(Temp='h')->findall(X,weather(X,'H'),WeatherList),
(Temp='n')->findall(X,weather(X,'N'),WeatherList),
write('WeatherList'),
write(WeatherList),nl,nl,nl,

%SEPARATION on TypeofPlace
(TypeofPlace='h')->findall(X,historical(X),TypeofPlaceList),
(TypeofPlace='n')->findall(X,nature(X),TypeofPlaceList),
(TypeofPlace='m')->findall(X,music(X),TypeofPlaceList),
(TypeofPlace='c')->findall(X,cultural(X),TypeofPlaceList),
(TypeofPlace='r')->findall(X,religious(X),TypeofPlaceList),
(TypeofPlace='b')->findall(X,bussinesshub(X),TypeofPlaceList),
(TypeofPlace='l')->findall(X,luxury(X),TypeofPlaceList),
write('TypeofPlaceList'),
write(TypeofPlaceList),nl,nl,nl,

%COMBINING ALL THE LISTS
inter(BudgetList, RegionList, X1),
inter(X1, FoodList, X2),
inter(X2, NightList, X3),
inter(X3, TypeofPlaceList, X4),
inter(X4, WeatherList, FinalList),
nl,nl,nl,
write('The Recommended List of Cities according to your answers is : '),nl,nl,
write(FinalList).





