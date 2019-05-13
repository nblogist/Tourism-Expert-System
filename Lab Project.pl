%Cost Data
cost('Seoul',477).
cost('New Orleans',100).
cost('Tokyo',494).
cost('Istanbul',33).
cost('Kuala Lumpur',73).
cost('Singapore',1000).
cost('TESTSingapore',1000).
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
weather('TESTSingapore','H').
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
nightLife('TESTSingapore').
nightLife('Singapore').

%Region
region('Seoul', 'Asia').
region('New Orleans','USA').
region('Tokyo','Asia').
region('Istanbul','Asia').
region('Kuala Lumpur', 'Asia').
region('Singapore', 'Asia').
region('TESTSingapore', 'Asia').
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
food('TESTSingapore').
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

religious('TESTSingapore').
nature('TESTSingapore').
cultural('TESTSingapore').
bussinesshub('TESTSingapore').
luxury('TESTSingapore').


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
write('Do you have a Region in mind? '), 
read(YN),
( 
    (YN=='y')
    ->write('Enter A for Asia; 
      U for The United States; 
      E for Europe; 
      B for Arabia; 
      O for Oceania: '),read(Region)
      ;Region='n'

)
  ,nl,nl,
write('What weather do you prefer? 
c for Cold; 
h for Hot; 
n for Normal'), read(Temp),
write('How many foods do you have in your favourite list? '), read(NumofFood),nl,nl,
write('What is your prefered time of travel? D for Day; N for night'), read(TimeofTravel),nl,nl,
write('What is your estimated budget in USD?'), read(TotalBudget),nl,nl,
write('How many days you have to tour? '), read(NumofDays),nl,nl,
write('Specify number of people? '), read(NumofPeople),nl,nl,


%SEPARATION ON BUDGET
Temp_budget is TotalBudget/NumofPeople,
Final_budget is Temp_budget/NumofDays,
findall(X, (cost(X,Y),Y=<Final_budget), BudgetList), 


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

%SEPARATION ON FOODIE
(NumofFood>5)->findall(X,food(X),FoodList),

%SEPARATION ON TimeofTravel
(TimeofTravel='n')->findall(X,nightLife(X),NightList),

inter(BudgetList, RegionList, X1),
inter(X1, FoodList, X2),
inter(X2, NightList, FinalList),
write('FINAL LIST'),nl,nl,
write('The Recommended List of Cities according to your answers is : '),nl,nl,
write(FinalList).
