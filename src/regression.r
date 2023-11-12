install.packages("car")
install.packages("spdep")
install.packages("adespatial")
install.packages("cli")
install.packages("spatialreg")
install.packages("reporttools")
install.packages("stargazer")
install.packages("texreg")

library(car)
library(spdep)
library(adespatial)
library(spatialreg)
library(reporttools)
library(stargazer)
library(texreg)

#Read data from csv
flow_data = read.csv("/Users/bensonchiu/Documents/Documents/111-2/Econometric/Econometrics_FP/final_data/ntu_station_locations_flow.csv")
head(flow_data)
View(flow_data)
dist_data = read.csv("/Users/bensonchiu/Documents/Documents/111-2/Econometric/Econometrics_FP/final_data/distance_matrix.csv")
head(dist_data)
station_dist = read.csv("/Users/bensonchiu/Documents/Documents/111-2/Econometric/Econometrics_FP/final_data/ntu_station_distances.csv")
View(station_dist)


dist_data_reshape = reshape(dist_data, idvar = "From", timevar = "Type", direction = "wide")
rownames(dist_data_reshape) <- NULL 
head(dist_data_reshape)
View(dist_data_reshape)


fun = function(x){1 / x}
dist_e = lapply(dist_data_reshape[,-1], fun)
View(dist_e)
dist_e_data = cbind(dist_data_reshape, dist_e)
colnames(dist_e_data)[2:35] <- c("dist.lib", "dist.manage", "dist.admin", 
                                 "dist.boya", "dist.lake", "dist.stadium",
                                 "dist.CINC", "dist.engineer", "dist.AC1", 
                                 "dist.ZLB", "dist.EE", "dist.SS",
                                 "dist.XFP", "dist.NTUST_res1", "dist.NTUST_res3", 
                                 "dist.MRT", "dist.Dorm", "dist.e.lib", 
                                 "dist.e.manage", "dist.e.admin", 
                                 "dist.e.boya", "dist.e.lake", 
                                 "dist.e.stadium", "dist.e.CINC", 
                                 "dist.e.engineer", "dist.e.AC1", 
                                 "dist.e.ZLB", "dist.e.EE", 
                                 "dist.e.SS", "dist.e.XFP", 
                                 "dist.e.NTUST_res1", "dist.e.NTUST_res3", 
                                 "dist.e.MRT", "dist.e.Dorm")
View(dist_e_data)



#hist of fr
hist(flow_data$Flow.A)
hist(flow_data$Flow.B)
hist(flow_data$Flow.C)
hist(flow_data$Flow.D)

#qqplot
qqPlot(flow_data$Flow.A)
qqPlot(flow_data$Flow.B)
qqPlot(flow_data$Flow.C)
qqPlot(flow_data$Flow.D)

#Test the normality of the flows
shapiro.test(flow_data$Flow.A)
shapiro.test(flow_data$Flow.B)
shapiro.test(flow_data$Flow.C)
shapiro.test(flow_data$Flow.D)

#Merge dataframes
merged_data = merge(flow_data, dist_e_data, by.x="Name", by.y = "From")
head(merged_data)
View(merged_data)

#descriptive statistics
stargazer(merged_data[,-1], title = "Descriptive Statistics", align = TRUE)

#OLS for Time A
model_A = lm(Flow.A ~ dist.lib + dist.manage + dist.admin 
             + dist.boya + dist.lake + dist.stadium
             + dist.CINC + dist.engineer + dist.AC1 
             + dist.ZLB + dist.EE + dist.SS 
             + dist.XFP + dist.NTUST_res1 + dist.NTUST_res3 
             + dist.MRT + dist.Dorm, data = merged_data)
summary(model_A)
shapiro.test(model_A$residuals)
hist(model_A$residuals)
plot(fitted(model_A), model_A$residuals)
abline(0, 0)
plot(density(model_A$residuals))

model_Ae = lm(Flow.A ~ dist.e.lib + dist.e.manage + dist.e.admin 
              + dist.e.boya + dist.e.lake + dist.e.stadium
              + dist.e.CINC + dist.e.engineer + dist.e.AC1 
              + dist.e.ZLB + dist.e.EE + dist.e.SS 
              + dist.e.XFP + dist.e.NTUST_res1 + dist.e.NTUST_res3 
              + dist.e.MRT + dist.e.Dorm, data = merged_data)
summary(model_Ae)

#OLS for Time B
model_B = lm(Flow.B ~ dist.lib + dist.manage + dist.admin 
             + dist.boya + dist.lake + dist.stadium
             + dist.CINC + dist.engineer + dist.AC1 
             + dist.ZLB + dist.EE + dist.SS 
             + dist.XFP + dist.NTUST_res1 + dist.NTUST_res3 
             + dist.MRT + dist.Dorm, data = merged_data)
summary(model_B)
shapiro.test(model_B$residuals)
hist(model_B$residuals)

model_Be = lm(Flow.B ~ dist.e.lib + dist.e.manage + dist.e.admin 
              + dist.e.boya + dist.e.lake + dist.e.stadium
              + dist.e.CINC + dist.e.engineer + dist.e.AC1 
              + dist.e.ZLB + dist.e.EE + dist.e.SS 
              + dist.e.XFP + dist.e.NTUST_res1 + dist.e.NTUST_res3 
              + dist.e.MRT + dist.e.Dorm, data = merged_data)
summary(model_Be)


#OLS for Time C
model_C = lm(Flow.C ~ dist.lib + dist.manage + dist.admin 
             + dist.boya + dist.lake + dist.stadium
             + dist.CINC + dist.engineer + dist.AC1 
             + dist.ZLB + dist.EE + dist.SS 
             + dist.XFP + dist.NTUST_res1 + dist.NTUST_res3 
             + dist.MRT + dist.Dorm, data = merged_data)
summary(model_C)
shapiro.test(model_C$residuals)
hist(model_C$residuals)

model_Ce = lm(Flow.C ~ dist.e.lib + dist.e.manage + dist.e.admin 
              + dist.e.boya + dist.e.lake + dist.e.stadium
              + dist.e.CINC + dist.e.engineer + dist.e.AC1 
              + dist.e.ZLB + dist.e.EE + dist.e.SS 
              + dist.e.XFP + dist.e.NTUST_res1 + dist.e.NTUST_res3 
              + dist.e.MRT + dist.e.Dorm, data = merged_data)
summary(model_Ce)

#OLS for Time D
model_D = lm(Flow.D ~ dist.lib + dist.manage + dist.admin 
             + dist.boya + dist.lake + dist.stadium
             + dist.CINC + dist.engineer + dist.AC1 
             + dist.ZLB + dist.EE + dist.SS 
             + dist.XFP + dist.NTUST_res1 + dist.NTUST_res3 
             + dist.MRT + dist.Dorm, data = merged_data)
summary(model_D)
shapiro.test(model_D$residuals)
hist(model_D$residuals)

model_De = lm(Flow.D ~ dist.e.lib + dist.e.manage + dist.e.admin 
              + dist.e.boya + dist.e.lake + dist.e.stadium
              + dist.e.CINC + dist.e.engineer + dist.e.AC1 
              + dist.e.ZLB + dist.e.EE + dist.e.SS 
              + dist.e.XFP + dist.e.NTUST_res1 + dist.e.NTUST_res3 
              + dist.e.MRT + dist.e.Dorm, data = merged_data)
summary(model_De)

#table output
#ols
stargazer(model_A, model_B, model_C, model_D, title="OLS Results", align=TRUE)
#olse
stargazer(model_Ae, model_Be, model_Ce, model_De, title="OLS Results with $D^e$", align=TRUE)
#moran test
stargazer(resA, resB, resC, resD, title = "Moran's I Test", align = TRUE)
#slm
screenreg(list(slmA, slmB, slmC, slmD))
stargazer(slmA, slmB, slmC, slmD, title="SLM Results", align=TRUE)


#morans' i

#weighted connectivity matrix
cartesian = matrix(c(flow_data$Latitude, cos(25*pi/180)*flow_data$Longitude), nrow = 103, ncol = 2)
head(cartesian)
w = listw.candidates(cartesian, nb = "gab", weights = "binary")
View(w)

#moran test on frs
moran.test(flow_data$Flow.A, w$Gabriel_Binary, alternative="greater")
moran.test(flow_data$Flow.B, w$Gabriel_Binary, alternative="greater")
moran.test(flow_data$Flow.C, w$Gabriel_Binary, alternative="greater")
moran.test(flow_data$Flow.D, w$Gabriel_Binary, alternative="greater")

#moran test on res
moran.test(model_Ae$residuals, w$Gabriel_Binary, alternative = "greater")
moran.test(model_Be$residuals, w$Gabriel_Binary, alternative = "greater")
moran.test(model_Ce$residuals, w$Gabriel_Binary, alternative = "greater")
moran.test(model_De$residuals, w$Gabriel_Binary, alternative = "greater")

#slmA
slmA <- spatialreg::lagsarlm(Flow.A ~ dist.lib + dist.manage + dist.admin 
                             + dist.boya + dist.lake + dist.stadium
                             + dist.CINC + dist.engineer + dist.AC1 
                             + dist.ZLB + dist.EE + dist.SS 
                             + dist.XFP + dist.NTUST_res1 + dist.NTUST_res3 
                             + dist.MRT + dist.Dorm, data = merged_data, 
                             listw = w$Gabriel_Binary, zero.policy = TRUE, 
                             na.action = na.omit)
summary(slmA)

slmAe <- spatialreg::lagsarlm(Flow.A ~ dist.e.lib + dist.e.manage + dist.e.admin 
                               + dist.e.boya + dist.e.lake + dist.e.stadium
                               + dist.e.CINC + dist.e.engineer + dist.e.AC1 
                               + dist.e.ZLB + dist.e.EE + dist.e.SS 
                               + dist.e.XFP + dist.e.NTUST_res1 + dist.e.NTUST_res3 
                               + dist.e.MRT + dist.e.Dorm, data = merged_data, listw = w$Gabriel_Binary, 
                              zero.policy = TRUE, na.action = na.omit)
summary(slmAe)
plot(fitted(slm_A), slm_A$residuals)
abline(0, 0)
plot(fitted(slm_Ae), slm_Ae$residuals)
abline(0, 0)

#slmB
slmB <- spatialreg::lagsarlm(Flow.B ~ dist.lib + dist.manage + dist.admin 
                             + dist.boya + dist.lake + dist.stadium
                             + dist.CINC + dist.engineer + dist.AC1 
                             + dist.ZLB + dist.EE + dist.SS 
                             + dist.XFP + dist.NTUST_res1 + dist.NTUST_res3 
                             + dist.MRT + dist.Dorm, data = merged_data, 
                             listw = w$Gabriel_Binary, zero.policy = TRUE, 
                             na.action = na.omit)
summary(slmB)

slmBe <- spatialreg::lagsarlm(Flow.B ~ dist.e.lib + dist.e.manage + dist.e.admin 
                               + dist.e.boya + dist.e.lake + dist.e.stadium
                               + dist.e.CINC + dist.e.engineer + dist.e.AC1 
                               + dist.e.ZLB + dist.e.EE + dist.e.SS 
                               + dist.e.XFP + dist.e.NTUST_res1 + dist.e.NTUST_res3 
                               + dist.e.MRT + dist.e.Dorm, data = merged_data, listw = w$Gabriel_Binary, 
                               zero.policy = TRUE, na.action = na.omit)
summary(slmBe)
#slmC

slmC <- spatialreg::lagsarlm(Flow.C ~ dist.lib + dist.manage + dist.admin 
                             + dist.boya + dist.lake + dist.stadium
                             + dist.CINC + dist.engineer + dist.AC1 
                             + dist.ZLB + dist.EE + dist.SS 
                             + dist.XFP + dist.NTUST_res1 + dist.NTUST_res3 
                             + dist.MRT + dist.Dorm, data = merged_data, 
                             listw = w$Gabriel_Binary, zero.policy = TRUE, 
                             na.action = na.omit)
summary(slmC)

slmCe <- spatialreg::lagsarlm(Flow.C ~ dist.e.lib + dist.e.manage + dist.e.admin 
                               + dist.e.boya + dist.e.lake + dist.e.stadium
                               + dist.e.CINC + dist.e.engineer + dist.e.AC1 
                               + dist.e.ZLB + dist.e.EE + dist.e.SS 
                               + dist.e.XFP + dist.e.NTUST_res1 + dist.e.NTUST_res3 
                               + dist.e.MRT + dist.e.Dorm, data = merged_data, listw = w$Gabriel_Binary, 
                               zero.policy = TRUE, na.action = na.omit)
summary(slmCe)
#slmD
slmD <- spatialreg::lagsarlm(Flow.D ~ dist.lib + dist.manage + dist.admin 
                             + dist.boya + dist.lake + dist.stadium
                             + dist.CINC + dist.engineer + dist.AC1 
                             + dist.ZLB + dist.EE + dist.SS 
                             + dist.XFP + dist.NTUST_res1 + dist.NTUST_res3 
                             + dist.MRT + dist.Dorm, data = merged_data, 
                             listw = w$Gabriel_Binary, zero.policy = TRUE, 
                             na.action = na.omit)
summary(slmD)

slmDe <- spatialreg::lagsarlm(Flow.D ~ dist.e.lib + dist.e.manage + dist.e.admin 
                               + dist.e.boya + dist.e.lake + dist.e.stadium
                               + dist.e.CINC + dist.e.engineer + dist.e.AC1 
                               + dist.e.ZLB + dist.e.EE + dist.e.SS 
                               + dist.e.XFP + dist.e.NTUST_res1 + dist.e.NTUST_res3 
                               + dist.e.MRT + dist.e.Dorm, data = merged_data, listw = w$Gabriel_Binary, 
                               zero.policy = TRUE, na.action = na.omit)
summary(slmDe)

