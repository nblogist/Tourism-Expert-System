
%city(477,c,n,a,n,bussinesshub):- write('Seoul').
%city(477,c,n,a,n,luxury):- write('Seoul').
%city(477,c,n,a,n,nature):- write('Seoul').



city(2000,c,n,a,n,historical):- write('Turkey').
city(2000,c,n,a,n,culture):- write('Turkey').
city(2000,c,n,a,n,nature):- write('Turkey').

city():- write('New Orleans').

city():- write('Tokya').

city():- write('Istanbul').

city():- write('Kaula Lampur').

city():- write('Singapore').

city():- write('NewYork').

city():- write('Dubai').

city(1100,art,e,n,art,c):- write('Paris').
city(1100,music,e,n,music,c):- write('Paris').
city(1100,nature,e,n,nature,c):- write('Paris').

city():- write('London').

city():- write('Bangkok').

city():- write('Venice').

city():- write('Hongkong').

city():- write('Lahore').

city():- write('Karachi').

city():- write('Islamabad').





yourGuide:-
write('Welcome to your guide, which will help you decide where to go next!'),nl,nl,
write('What kind of place do you like to vist? 
 H for Historical; 
 N for Natural Beauty;
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

findall(X,(city(B,P,R,N,T),B<1000),Z),
write(Z),

findall(X,(city(B,P,R,N,T),T is Temp),Z),
write(Z),

findall(X,(city(B,P,R,N,T)),R is Region),Z),
write(Z),

findall(X,(city(B,P,R,N,T)),N is TimeofTravel),Z),
write(Z),

findall(X,(city(B,P,R,N,T),P is TypeofPlace),Z),
write(Z),


city(TotalBudget,TypeofPlace,Region,Temp,TimeofTravel).
