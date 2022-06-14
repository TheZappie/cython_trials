#Cython

Trying out cython on a few different small projects. 

## Inception Juffen
Juffen is a drinking game. It has a challenging variant, recursive juffen, also called inception juffen (named after the [movie](https://www.imdb.com/title/tt1375666/)). 

A set of 'forbidden' numbers are chosen at start of the game. In turn, each person calls a number. This number sequentially increase each turn (starting at 1). When at a forbidden number, the sequence of deeper layer should be continued instead, or one should be started.
The first numbers of 538 inception juffen are: 1,2,1,4,2,1,7,4,5,2,11

This script aims to 'play the game' as fast as possible, by returning a sequence of numbers that are the solution to the game. 
