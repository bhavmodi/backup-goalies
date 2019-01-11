# How important is a backup goalie for success in the NHL?

The goaltender, or goalie, is arguably the most important position in hockey. They are relied upon as the last line of defense. They play the entire game, whereas no one skater will play more than half the game. Teams often have a starter and backup goalie, with the starter playing most of the games. The backup goalie can come in when the starting goalie needs rest or is injured. While teams emphasize the importance of locking down a good starting goalie (as exemplified by the massive contract given to Montreal Canadiens' #1 goalie Carey Price), are backups just as important? The following sets of analyses attempt to answer this question.
I will begin with a brief discussion of the statistics for this project. 
### Goalie Analytics
Goalie analytics has the inherent challenge of parsing out individual goalie performance from team performance. Traditional goalie statistics are *save percentage (SV%)* and *Goals Against Average (GAA)*. 

SV% = shots saved / shots faced  
GAA = the number of goals allowed per 60 minutes of playing time

If a team's defensive players are terrible, even a superstar goalie's stats will decrease. A good defense reduces the number of high-danger chances allowed, which lets the goalie make easy saves and results in fewer goals. A poor defense, however, fails to prevent high-danger chances which have a higher percentage of scoring. Goalie analytics is relatively recent, but two prominent statistics have emerged to be a better representation of a goaltender's true performance.

#### GSAA
GSAA stands for *Goals Saved Above Average*. Essentially, this statistic reflects how the goalie is performing compared to the league average. It applies the league average save percentage to the number (and quality) of shots faced by the goalie of interest, which is then subtracted by the goalie's current goals allowed. The formula is:  
`(shots against * (1 - league average SV%)) - goals allowed`  
This statistic puts all goalies on an equal footing and removes the effect of team quality. A goalie with a positive GSAA saves more goals than the league average; a negative GSAA means the goalie surrenders more goals than the league average. For example, a goalie with a 8.0 GSAA saved 8 more goals than an average goalie. If that goalie were to be replaced with an average goalie, the team would have yielded 8 additional goals.  
[corsica.hockey](https://www.corsicahockey.com/nhl/players/nhl-player-stats/goalie-stats) calculates GSAA for all goalies in the NHL, and their model incorporates shot quality as well as shot quantity. Hence, high-danger shots, or shots that have a much higher percentage of scoring, are weighted more. A goalie who saves more high-danger shots is better than a goalie who faces and saves medium- or low-danger shots, which is reflected in the GSAA.

#### dSV%
dSV% means Delta Save Percentage, or Adjusted Save Percentage. For each goalie, an expected save percentage (xSV%) is calculated based on the quality and quantity of shots they face. eSV% reflects how an average goalie in the league would perform given the number and quality of shots. The formula for dSV% is:
`SV% - xSV%`  
A positive dSV% means the goalie is performing above average, whereas a negative dSV% means the goalie is performing below average.  

