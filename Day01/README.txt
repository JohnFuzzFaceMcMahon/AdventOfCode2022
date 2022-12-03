# john@mcmahon.engineering
# https://github.com/JohnFuzzFaceMcMahon/AdventOfCode2022
# Day01

2022-12-03 Now doing the problems in awk and go. I'm teaching myself go.

-------------------------------
What did I misunderstand today?
-------------------------------

When you use asort() the highest values are at the bottom of the array NOT the top!

--------------
Program Output
--------------

- Part 1 with Test Data

% awk -f Day01-P1.awk test.data.txt 
Elf 4 has 24000 calories

% go run Day01-P1and2.go <test.data.txt
(go) Day 1 Part 1
(go) Single elf max calories is 24000
(go) Day 1 Part 2
(go) Top 3 Elves have 45000 calories

- Part 2 with Test Data

% awk -f Day01-P2.awk test.data.txt
Top three elves are carrying 45000 calories

% go run Day01-P1and2.go <test.data.txt
(go) Day 1 Part 1
(go) Single elf max calories is 24000
(go) Day 1 Part 2
(go) Top 3 Elves have 45000 calories

- Part 1 with Input Data

% awk -f Day01-P1.awk input.data.txt
Elf 180 has 66719 calories

% go run Day01-P1and2.go <input.data.txt
(go) Day 1 Part 1
(go) Single elf max calories is 66719
(go) Day 1 Part 2
(go) Top 3 Elves have 198551 calories

- Part 2 with Input Data

% awk -f Day01-P2.awk input.data.txt
Top three elves are carrying 198551 calories

% go run Day01-P1and2.go <input.data.txt
(go) Day 1 Part 1
(go) Single elf max calories is 66719
(go) Day 1 Part 2
(go) Top 3 Elves have 198551 calories

-----
Stats
-----

      -------Part 1--------   -------Part 2--------
Day       Time  Rank  Score       Time  Rank  Score
  1   00:12:56  6370      0   00:27:30  8151      0
