# john@mcmahon.engineering
# https://github.com/JohnFuzzFaceMcMahon/AdventOfCode2022
# Day02

--------------------
Dumb Move Of The Day
--------------------

Do you need to sanitize your inputs with gsub()

--------------
Program Output
--------------

% awk -f Day02-P1.awk Day02.test.input.txt 
1 Moves AY WIN Their Score (+1) 1 My Score (+8) 8
2 Moves BX LOSE Their Score (+8) 9 My Score (+1) 9
3 Moves CZ TIE Their Score (+6) 15 My Score (+6) 15

% awk -f Day02-P2.awk Day02.test.input.txt
1 Moves AY Result TIE Their Score (+4) 4 My Score (+4) 4
2 Moves BX Result LOSE Their Score (+8) 12 My Score (+1) 5
3 Moves CZ Result WIN Their Score (+3) 15 My Score (+7) 12

% awk -f Day02-P1.awk Day02.real.input.txt
1 Moves CX WIN Their Score (+3) 3 My Score (+7) 7
2 Moves CX WIN Their Score (+3) 6 My Score (+7) 14
3 Moves AY WIN Their Score (+1) 7 My Score (+8) 22
[edited]
2497 Moves CZ TIE Their Score (+6) 12151 My Score (+6) 13792
2498 Moves CZ TIE Their Score (+6) 12157 My Score (+6) 13798
2499 Moves AY WIN Their Score (+1) 12158 My Score (+8) 13806
2500 Moves AZ LOSE Their Score (+7) 12165 My Score (+3) 13809

% awk -f Day02-P2.awk Day02.real.input.txt
1 Moves CX Result LOSE Their Score (+9) 9 My Score (+2) 2
2 Moves CX Result LOSE Their Score (+9) 18 My Score (+2) 4
3 Moves AY Result TIE Their Score (+4) 22 My Score (+4) 8
[edited]
2498 Moves CZ Result WIN Their Score (+3) 12301 My Score (+7) 12304
2499 Moves AY Result TIE Their Score (+4) 12305 My Score (+4) 12308
2500 Moves AZ Result WIN Their Score (+1) 12306 My Score (+8) 12316

-----
Stats
-----

       --------Part 1--------   --------Part 2--------
Day       Time   Rank  Score       Time   Rank  Score
  2   00:55:31  16131      0   01:12:47  15891      0
  1   00:12:56   6370      0   00:27:30   8151      0
