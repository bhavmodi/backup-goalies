library(psych)
library(car)
library(lsr)

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

### Playoff appearance as the outcome
## GSAA 
aggregate(Backups$GSAA5v5, by=list(Backups$PlayoffF), mean)
aggregate(Backups$GSAA5v5, by=list(Backups$PlayoffF), sd)
leveneTest(GSAA5v5 ~ PlayoffF, data = Backups) # homogeneity of variance
t.test(GSAA5v5 ~ PlayoffF, data = Backups)
# Boxplot
plot(Backups$PlayoffF, Backups$GSAA5v5,
     xlab = "Playoff Appearance", ylab = "GSAA at 5v5",
     main = "Effect of GSAA on Making Playoffs")
cohensD(GSAA5v5 ~ PlayoffF, data = Backups)
# Pretty moderate effect size
## dSV% 
aggregate(Backups$dSVperc, by=list(Backups$PlayoffF), mean)
aggregate(Backups$dSVperc, by=list(Backups$PlayoffF), sd)
leveneTest(dSVperc ~ PlayoffF, data = Backups) # homogeneity of variance
t.test(dSVperc ~ PlayoffF, data = Backups)
# Boxplot
plot(Backups$PlayoffF, Backups$dSVperc,
     xlab = "Playoff Appearance", ylab = "dSV% at 5v5",
     main = "Effect of dSV% on Making Playoffs",
     sub = "dSV% = difference between expected and actual save percentage")
cohensD(dSVperc ~ PlayoffF, data = Backups)

### Team points as the outcome
## dSV%
cor.test(Backups$dSVperc, Backups$TeamPoints)
# Scatterplot
plot(Backups$TeamPoints, Backups$dSVperc,
     xlab = "Points in Standings", ylab = "dSV%",
     main = "Effect of dSV% on Team Performance")
abline(lm(Backups$dSVperc ~ Backups$TeamPoints), col="red")
## GSAA
cor.test(Backups$GSAA5v5, Backups$TeamPoints)
# Scatterplot
scatterplot(dSVperc ~ TeamPoints | PlayoffF, data = Backups,
            xlab = "Points in Standings", ylab = "dSV%",
            main = "Effect of Backup Goalie dSV% on Team Performance",
            grid = F, smooth = F,
            legend = list(title = "Playoffs"),
            col = c("purple", "darkgreen"))


