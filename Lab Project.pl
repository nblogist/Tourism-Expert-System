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
cost('New York',553).
cost('Dubai',290).
cost('Paris',50).
cost('London',579).
cost('Bangkok',67).
cost('Venice',117).
cost('Hong Kong',515) .
cost('Karachi',100) .
cost('Lahore',50).
cost('Sydney',200) .

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

%foodie:-(NumofFood>10)->food(_)

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
yourGuide:-
write('Welcome to your guide, which will help you decide where to go next!'),nl,nl,
write('What kind of place do you like to vist? 
 H for Historical; N for Natural Beauty;
 M for Music; C for Cultural; 
 R for Religious; 
 B for Business Hubs; 
 L for Luxury; 
 D for, do not care!'),
read(TypeofPlace),nl,nl,
write('Do you have a specific region in mind? Y/N'), read(YN),
(YN=='Y')->write('
Enter A for Asia; 
U for The United States; 
E for Europe; 
B for Arabia; 
O for Oceania: '),nl,nl,
read(Region);Region='N',nl,nl,
write('What weather do you prefer? 
C for Cold; 
H for Hot; 
N for Normal'), read(Temp),
write('How many foods do you have in your favourite list? '), read(NumofFood),nl,nl,
write('What is your prefered time of travel? D for Day; N for night'), read(TimeofTravel),nl,nl,
write('What is your estimated budget in USD?'), read(TotalBudget),nl,nl,
write('How many days you have to tour? '), read(NumofDays),nl,nl,
write('What do you prefer? 
S for Single Bed Room; 
T for Twin Bed Room; 
D for Dorm Rooms; 
Q for Queen Room; 
K for King Room '),nl,nl,
read(RoomType),
write('Specify number of people? '), read(NumofPeople).



