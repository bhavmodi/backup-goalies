# How important is a backup goalie for success in the NHL?

The goaltender, or goalie, is arguably the most important position in hockey. They are relied upon as the last line of defense. They play the entire game, whereas no one skater will play more than half the game. Teams often have a starter and backup goalie, with the starter playing most of the games. The backup goalie can come in when the starting goalie needs rest or is injured. While teams emphasize the importance of locking down a good starting goalie (as exemplified by the massive contract given to Montreal Canadiens' #1 goalie Carey Price), are backups just as important? The following sets of analyses attempt to answer this question.
I will begin with a brief discussion of the statistics used in this project. 
### Goalie Statistics
The process of analyzing goalies has the inherent challenge of parsing out individual goalie performance from team performance. Traditional goalie statistics are *save percentage (SV%)* and *Goals Against Average (GAA)*. 

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

### Data
The first step in cleaning the data was determining how to define a starter and backup goalie. The starting goalie was defined as the goalie who plays the majority of the games for a team in that season. However, in some cases, the goalie which played the majority of the games only did so due to injury of the other goalie. For example, in the 2015-16 season, Montreal's starting goalie, Carey Price, only played in 12 games. In previous and subsequent seasons, Price played the majority of the games, but in 2015, he suffered an injury, forcing Mike Condon to play most of Montreal's games. Since the role of a backup goalie is to play in lieu of the starter given an injury, Price was classified as the starter and Condon as the backup, even though Condon played most of the games. Similar logic was used for teams whose starting goalie suffered a significant injury, preventing them from playing.

Next, I had to determine what defined "team success". In general, a team's season is successful if they make the playoffs. 16 teams make the playoffs each season, with 14 or 15 teams missing. Hence, teams who make the playoffs performed better than about half the league. Team points is another statistic which reflects success, since teams gain two points for each game they win. Both of these statistics were used as a measure of team success.

### Analysis
First, GSAA and dSV% for backup goalies were compared across backup goalies whose teams made the playoffs and those who did not. GSAA for backup goalies who did not make the playoffs (M = -2.14, SD = 6.01) was significantly lower than GSAA for backup goalies that did make the playoffs (M = 1.63, SD = 6.83), *t*(106.74) = -3.09, *p* < .01. Additionally, dSV% for backups who did not make the playoffs  (M = -0.38, SD = 1.14) was also significantly lower than dSV% for backups who made the playoffs (M = 0.21, SD = 1.36), *t*(105) = -2.47, *p* < .05.
