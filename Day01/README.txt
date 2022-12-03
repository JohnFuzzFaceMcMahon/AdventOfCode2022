# john@mcmahon.engineering
# https://github.com/JohnFuzzFaceMcMahon/AdventOfCode2022
# Day01

-------------------------------
What did I misunderstand today?
-------------------------------

When you use asort() the highest values are at the bottom of the array NOT the top!

--------------
Program Output
--------------

% awk -f Day01-P1.awk test.data.txt 
Elf 4 has 24000 calories

% awk -f Day01-P2.awk test.data.txt
Top three elves are carrying 45000 calories

% awk -f Day01-P1.awk input.data.txt
Elf 180 has 66719 calories

% awk -f Day01-P2.awk input.data.txt
Top three elves are carrying 198551 calories

-----
Stats
-----

      -------Part 1--------   -------Part 2--------
Day       Time  Rank  Score       Time  Rank  Score
  1   00:12:56  6370      0   00:27:30  8151      0
