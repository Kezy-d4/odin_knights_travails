# Knights Travails
A Ruby implementation of the Knights Travails DSA exercise developed as part of the 
[The Odin Project](https://www.theodinproject.com/) curriculum. Here's a link to
[the relevant project lesson](https://www.theodinproject.com/lessons/ruby-knights-travails).

The object of Knights Travails is as follows: Given source coordinates and destination coordinates 
on an 8x8 chessboard, write a program that determines the shortest path from source to destination
using only valid Knight moves. This is possible because the Knight can eventually reach any square 
on the chessboard given enough moves.

This implementation solves the problem by performing a breadth first search of the implicit graph, 
modified to track the shortest path to the destination.

<img width="740" height="162" alt="knights_travails" src="https://github.com/user-attachments/assets/e3ca2662-2ebf-4775-8f14-4dc62595a991" />
