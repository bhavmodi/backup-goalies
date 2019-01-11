library(psych)
library(car)
library(lsr)

### For an explanation of the goalie stats, see:
### https://www.blueshirtsbreakaway.com/2017/11/16/a-beginners-guide-to-goaltender-advanced-stats/

Goalies$PlayoffF <- factor(Goalies$Playoff,
                           level = c(0:1),
                           label = c("No", "Yes"))
Goalies$StarterF <- factor(Goalies$Starter,
                           level = c(0:2),
                           label = c("Backup", "Starter", "Tandem"))
# Select only backup goalies
Backups <- subset(Goalies, Starter == 0)
table(Goalies$Starter)
table(Backups$PlayoffF)

### Is there a diff in performance b/w backups on teams who made the playoffs and those who didn't?
## Adjusted SV%
aggregate(Backups$AdjStSVperc, by=list(Backups$PlayoffF), mean)
aggregate(Backups$AdjStSVperc, by=list(Backups$PlayoffF), sd)
leveneTest(AdjSVperc ~ PlayoffF, data = Backups) # homogeneity of variance
t.test(AdjSVperc ~ PlayoffF, data = Backups)
cohensD(AdjSVperc ~ PlayoffF, data = Backups)
# difference of 0.9% with a high effect size
## Let's try 5v5 SV%
aggregate(Backups$SVperc5v5, by=list(Backups$PlayoffF), mean)
aggregate(Backups$SVperc5v5, by=list(Backups$PlayoffF), sd)
leveneTest(SVperc5v5 ~ PlayoffF, data = Backups) # homogeneity of variance
t.test(SVperc5v5 ~ PlayoffF, data = Backups)
cohensD(SVperc5v5 ~ PlayoffF, data = Backups)
# Smaller effect but still significant

## GSAA is probs the best measure of goalie perf so let's look at that
aggregate(Backups$GSAA5v5, by=list(Backups$PlayoffF), mean)
aggregate(Backups$GSAA5v5, by=list(Backups$PlayoffF), sd)
leveneTest(GSAA5v5 ~ PlayoffF, data = Backups) # homogeneity of variance
t.test(GSAA5v5 ~ PlayoffF, data = Backups)
plot(Backups$PlayoffF, Backups$GSAA5v5,
     xlab = "Playoff Appearance", ylab = "GSAA at 5v5",
     main = "Effect of GSAA on Making Playoffs")
cohensD(GSAA5v5 ~ PlayoffF, data = Backups)
# Pretty moderate effect size

# dSV% is also a pretty good measure
aggregate(Backups$dSVperc, by=list(Backups$PlayoffF), mean)
aggregate(Backups$dSVperc, by=list(Backups$PlayoffF), sd)
leveneTest(dSVperc ~ PlayoffF, data = Backups) # homogeneity of variance
t.test(dSVperc ~ PlayoffF, data = Backups)
plot(Backups$PlayoffF, Backups$dSVperc,
     xlab = "Playoff Appearance", ylab = "dSV% at 5v5",
     main = "Effect of dSV% on Making Playoffs",
     sub = "dSV% = difference between expected and actual save percentage")
cohensD(dSVperc ~ PlayoffF, data = Backups)

# How important is goal support?
aggregate(Backups$Gsupp, by=list(Backups$PlayoffF), mean)
aggregate(Backups$Gsupp, by=list(Backups$PlayoffF), sd)
leveneTest(Gsupp ~ PlayoffF, data = Backups) # homogeneity of variance
t.test(Gsupp ~ PlayoffF, data = Backups)
plot(Backups$PlayoffF, Backups$Gsupp,
     xlab = "Playoff Appearance", ylab = "Goal Support",
     main = "Effect of Goal Support on Making Playoffs")
cohensD(Gsupp ~ PlayoffF, data = Backups)
# Higher effect size than the other two
