# john@mcmahon.engineering
# https://github.com/JohnFuzzFaceMcMahon/AdventOfCode2022
# Day04

--------------------
Dumb Move Of The Day
--------------------

I tried to get cute with bitwise and().

You will probably not want to use and() on a number that exceeds 2^HIGH-NUMBER
due to a potential for rounding error. See the exerpt from the gawk 
man page...

Bit Manipulations Functions
        Gawk supplies the following bit manipulation functions.  They work by converting double-precision floating point values to uintmax_t
        integers, doing the operation, and then converting the result back to floating point.  Passing negative operands to any of these
        functions causes a fatal error.
 
        The functions are:
 
        and(v1, v2 [, ...])
                          Return the bitwise AND of the values provided in the argument list.  There must be at least two.

--------------
Program Output
--------------

% awk -f Day04-P1.awk test.data.txt
Result 2

% awk -f Day04-P2.awk test.data.txt
Result 4

% awk -f Day04-P1.awk real.data.txt
Result 453

% awk -f Day04-P2.awk real.data.txt
Result 919

-----
Stats
-----

Rank 1 (17 points) on Private Leaderboard "W"
Rank 2 (79 points) on Private Leaderboard "J"

       --------Part 1--------   --------Part 2--------
Day       Time   Rank  Score       Time   Rank  Score
  4   01:30:04  18445      0   01:47:52  18743      0
  3   00:14:38   4993      0   00:26:55   5791      0
  2   00:55:31  16131      0   01:12:47  15891      0
  1   00:12:56   6370      0   00:27:30   8151      0