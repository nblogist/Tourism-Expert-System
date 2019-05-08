city1:-write('Seoul').
city2:-write('New Orleans').
city3:-write('Tokyo').
city4:-write('Istanbul').
city5:-write('Kuala Lumpur').
city6:-write('Singapore').
city7:-write('New York').
city8:-write('Dubai').
city9:-write('Paris').
city10:-write('London').
city11:-write('Bangkok').
city12:-write('Venice').
city13:-write('Hong Kong').
city14:-write('Karachi').
city15:-write('Lahore').
city16:-write('Sydney').

%Cost Data
cost('Seoul',477).
cost('New Orleans',100).
cost('Tokyo',494).
cost('Istanbul',33).
cost('Kuala Lumpur',73).
cost('Singapore',468).
cost('New York',1553).
cost('Dubai',2900).
cost('Paris',1550).
cost('London',5079).
cost('Bangkok',607).
cost('Venice',1017).
cost('Hong Kong',1515) .
cost('Karachi',100) .
cost('Lahore',50).
cost('Sydney',1200) .

%Weather Data
weather('Seoul','C').
weather('New Orleans','H').
weather('Tokyo','C').
weather('Istanbul','C').
weather('Kuala Lumpur','H').
weather('Singapore','H').
weather('New York','N').
weather('Dubai','H').
weather('Paris','N').
weather('London','N').
weather('Bangkok','H').
weather('Venice','N').
weather('Hong Kong','N').
weather('Karachi','N').
weather('Lahore','N').
weather('Sydney','N').

%Night Life
nightLife('Tokyo').
nightLife('New Orleans').
nightLife('New York').
nightLife('Dubai').
nightLife('Paris').
nightLife('London').
nightLife('Bangkok').
nightLife('Hong Kong').
nightLife('Karachi').
nightLife('Lahore').
nightLife('Sydney').

%Region
region('Seoul', 'Asia').
region('New Orleans','USA').
region('Tokyo','Asia').
region('Istanbul','Asia').
region('Kuala Lumpur', 'Asia').
region('Singapore', 'Asia').
region('New York', 'USA').
region('Dubai', 'Arab').
region('Paris','Europe').
region('London','Europe').
region('Bangkok','Asia').
region('Venice','Europe').
region('Hong Kong','Asia').
region('Karachi','Asia').
region('Lahore', 'Asia').
region('Sydney','Oceania').

%Foodie Data
food('Tokyo').
food('Istanbul').
food('Singapore').
food('New York').
food('Paris').
food('Bangkok').
food('Karachi').
food('Lahore').


%Famous for Data
bussinesshub('Seoul').
luxury('Seoul').
nature('Seoul').

music('New Orleans').
cultural('New Orleans').
luxury('New Orleans').

historical('Tokyo').
bussinesshub('Tokyo').
luxury('Tokyo').
cultural('Tokyo').

luxury('Istanbul').
cultural('Istanbul').
historical('Istanbul').
nature('Istanbul').

religious('Kuala Lumpur').
modern('Kuala Lumpur').
bussinesshub('Kuala Lumpur').
cultural('Kuala Lumpur').

religious('Singapore').
nature('Singapore').
cultural('Singapore').
bussinesshub('Singapore').
luxury('Singapore').

luxury('New York').
bussinesshub('New York').
music('New York').

modern('Dubai').
architecture('Dubai').
music('Dubai').
bussinesshub('Dubai').
luxury('Dubai').

historical('Paris').
music('Paris').
art('Paris').
architecture('Paris').
nature('Paris').
music('Paris').
luxury('Paris').

historical('London').
music('London').
nature('London').
luxury('London').

religious('Bangkok').
historical('Bangkok').
nature('Bangkok').
cultural('Bangkok').
bussinesshub('Bangkok').
luxury('Bangkok').


luxury('Venice').
historical('Venice').
nature('Venice').

luxury('Hong Kong').
historical('Hong Kong').
nature('Hong Kong').
cultural('Hong Kong').

historical('Karachi').
cultural('Karachi').
bussinesshub('Karachi').
music('Karachi').

historical('Lahore').
cultural('Lahore').
music('Lahore').

bussinesshub('Sydney').
luxury('Sydney').

inter([], _, []).

inter([H1|T1], L2, [H1|Res]) :-
    member(H1, L2),
    inter(T1, L2, Res).

inter([_|T1], L2, Res) :-
    inter(T1, L2, Res).

yourGuide:-
write('Welcome to your guide, which will help you decide where to go next!'),nl,nl,
write('What kind of place do you like to vist? 
 h for Historical; 
 n for Natural Beauty;
 m for Music; 
 c for Cultural; 
 r for Religious; 
 b for Business Hubs; 
 l for Luxury; 
 d for, do not care!'),
read(TypeofPlace),nl,nl,
write('Do you have a specific region in mind? Y/N'), read(YN),
(YN='y')->(write('
Enter 
a for Asia; 
u for The United States; 
e for Europe; 
b for Arabia; 
o for Oceania: '),
read(Region);
Region='n',nl,nl),
write('What weather do you prefer? 
c for Cold; 
h for Hot; 
n for Normal'), read(Temp),
write('How many foods do you have in your favourite list? '), read(NumofFood),nl,nl,
write('What is your prefered time of travel? D for Day; N for night'), read(TimeofTravel),nl,nl,
write('What is your estimated budget in USD?'), read(TotalBudget),nl,nl,
write('How many days you have to tour? '), read(NumofDays),nl,nl,
write('Specify number of people? '), read(NumofPeople),nl,nl,
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
findall(X, (cost(X,Y),Y<Final_budget), BudgetList), 
write('List of Possible Cities'),nl,nl,
write(BudgetList),nl,nl,

%SEPARATION ON REGION
(YN = 'n')->
(
(Region='a')->findall(X,region(X,'Asia'),RegionList);
(Region='u')->findall(X,region(X,'USA'),RegionList);
(Region='e')->findall(X,region(X,'Europe'),RegionList);
(Region='b')->findall(X,region(X,'Arabia'),RegionList);
(Region='o')->findall(X,region(X,'Ocenia'),RegionList);
write()
),
write(RegionList),

%SEPARATION ON FOODIE
(NumofFood>5)->findall(X,food(X),FoodList),

%SEPARATION ON TimeofTravel
(TimeofTravel='n')->findall(X,nightLife(X),NightList),

%SEPARATION on TypeofPlace
(TimeofTravel='h')->findall(X,historical(X),NightList),
(TimeofTravel='n')->findall(X,nature(X),NightList),
(TimeofTravel='m')->findall(X,music(X),NightList),
(TimeofTravel='c')->findall(X,cultural(X),NightList),
(TimeofTravel='r')->findall(X,religious(X),NightList),
(TimeofTravel='b')->findall(X,bussinesshub(X),NightList),
(TimeofTravel='l')->findall(X,luxury(X),NightList).

%SEPARATION ON WEATHER
(Temp='c')->findall(X,weather(X,'C'),WeatherList),
(Temp='h')->findall(X,weather(X,'H'),WeatherList),
(Temp='n')->findall(X,weather(X,'N'),WeatherList),

%COMBINING ALL THE LISTS
inter(BudgetList, RegionList, X1),
inter(X1, FoodList, X2),
inter(X2, NightList, X3),
inter(X3, WeatherList, FinalList),
nl,nl,nl,
write('The Recommended List of Cities according to your answers is : '),nl,nl,
write(FinalList).