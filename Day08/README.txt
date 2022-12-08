# john@mcmahon.engineering
# https://github.com/JohnFuzzFaceMcMahon/AdventOfCode2022
# --- Day 8: Treetop Tree House ---

--------------------
Dumb Move Of The Day
--------------------

1) Sanitize those inputs!
2) break can be very useful, assuming it is firing in the right place

--------------
Program Output
--------------

% awk -f Day08-P1.awk test.data.txt | tail -1
Result 21
% awk -f Day08-P1.awk real.data.txt | tail -1
Result 1832
% awk -f Day08-P2.awk test.data.txt | tail -1
Result 8 at 3,4
% awk -f Day08-P2.awk real.data.txt | tail -1
Result 157320 at 24,61

-----
Stats
-----

Rank 1 of 3 (035/035 points) on Private Leaderboard "W"
Rank 3 of 8 (179/192 points) on Private Leaderboard "J"

Fastest finish time is Day 3 at 00:26:55.

       --------Part 1--------   --------Part 2--------
Day       Time   Rank  Score       Time   Rank  Score
  8   01:25:56  13073      0   01:42:31  10674      0
  7   01:27:31   8865      0   01:44:59   9024      0
  6   00:19:20  11065      0   00:36:11  14131      0
  5   00:51:13   9987      0   00:57:02   9469      0
  4   01:30:04  18445      0   01:47:52  18743      0
  3   00:14:38   4993      0   00:26:55   5791      0
  2   00:55:31  16131      0   01:12:47  15891      0
  1   00:12:56   6370      0   00:27:30   8151      0