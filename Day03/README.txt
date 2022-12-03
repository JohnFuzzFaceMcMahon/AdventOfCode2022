# john@mcmahon.engineering
# https://github.com/JohnFuzzFaceMcMahon/AdventOfCode2022
# Day03

--------------------
Dumb Move Of The Day
--------------------

for ( i ) {
      for ( i ) {
            # You can't use the same index in two levels of a nested loop!
      }
} 

--------------
Program Output
--------------

% awk -f Day03-P1.awk test.data.txt
Duplicate p in 1
Duplicate L in 2
Duplicate P in 3
Duplicate v in 4
Duplicate t in 5
Duplicate s in 6
Total Priority: 157

% awk -f Day03-P2.awk test.data.txt
Group 1 common element is r (18)
Group 4 common element is Z (52)
Total Priority: 70

% awk -f Day03-P1.awk input.data.txt
Duplicate w in 1
Duplicate Q in 2
Duplicate d in 3
[edited]
Duplicate n in 298
Duplicate F in 299
Duplicate f in 300
Total Priority: 8298

% awk -f Day03-P2.awk input.data.txt
Group 1 common element is W (49)
Group 4 common element is V (48)
Group 7 common element is C (29)
[edited]
Group 292 common element is N (40)
Group 295 common element is N (40)
Group 298 common element is v (22)
Total Priority: 2708

-----
Stats
-----

       --------Part 1--------   --------Part 2--------
Day       Time   Rank  Score       Time   Rank  Score
  3   00:14:38   4993      0   00:26:55   5791      0
  2   00:55:31  16131      0   01:12:47  15891      0
  1   00:12:56   6370      0   00:27:30   8151      0
