read(INPUT),
(
(INPUT=1)->power;
(INPUT=2)->sound;
(INPUT=3)->connection;
(INPUT=4)->freeze;
(INPUT=5)->screen_blank;
(INPUT=6)->restarts;
(INPUT=7)->keyboard;
(INPUT=8)->mouse;
(INPUT=9)->printer;
(INPUT=10)->slow;
(INPUT=11)->browser_page;
(INPUT=12)->Hw_sw;
(INPUT=13)->blue_screen;
(INPUT=14)->dll_missing;
(INPUT=15)->Popup_ads;
write('wrong input')
).