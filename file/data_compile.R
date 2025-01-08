library(ggplot2)
library(dplyr)
library(tidyr)
library(psych)
library(car)
library(visreg)
library(corrplot)
library(ggcorrplot)
library(ResourceSelection)
library(PerformanceAnalytics)

# 데이터파일 불러오기
mosq_data <- read.csv("./dataset/서울시_모기예보제_정보.csv",
                         header = TRUE, stringsAsFactors = TRUE, sep = ",", fileEncoding = 'euc-kr')
weather_data <- read.csv("./dataset/OBS_ASOS_DD.csv",
                         header = TRUE, stringsAsFactors = TRUE, sep = ",", fileEncoding = 'euc-kr')
View(mosq_data)
View(weather_data)

# 불필요한 열 제거
weather_data <- weather_data[,-(1:2)]

# 컬럼명 변경
names(weather_data) <- c('date','avg_temp','precipitation','avg_humidity')
names(weather_data)
names(mosq_data) <- c('date','waterfront','residence','park')
names(mosq_data)

# 날짜를 키값으로 데이터 병합
mg_data <- merge(weather_data,mosq_data,by='date')
View(mg_data)

# -----------EDA전처리-----------
#중복값 확인
duplicates <- mg_data %>% duplicated() %>% table()
duplicates # 관측치 값이 같아서 생기는 현상

#결측치 확인
table(is.na(mg_data))

# 결측치 대체
mg_data$avg_temp <- ifelse(is.na(mg_data$avg_temp), 0 ,mg_data$avg_temp)
mg_data$precipitation <- ifelse(is.na(mg_data$precipitation), 0, mg_data$precipitation)
mg_data$avg_humidity <- ifelse(is.na(mg_data$avg_humidity), 0 ,mg_data$avg_humidity)
mg_data$waterfront <- ifelse(is.na(mg_data$waterfront), 0, mg_data$waterfront)
mg_data$residence <- ifelse(is.na(mg_data$residence), 0, mg_data$residence)
mg_data$park <- ifelse(is.na(mg_data$park), 0, mg_data$park)

table(is.na(mg_data))

# -----------상관관계 분석-----------
# 날짜는 필요 없으므로 제거
c_data <- mg_data[,-1]
View(c_data)

# 결측치 확인
table(is.na(c_data))

# 상관관계 확인 (시각화)
M = cor(c_data)
corrplot(M, method = 'shade', addCoef.col = "black")

# -----------다중회귀분석(수변부, 주거지, 공원)-----------
lm_1 <- lm(waterfront ~ avg_temp  + avg_humidity, data = c_data)
summary(lm_1)
lm_2 <- lm(residence ~ avg_temp + avg_humidity, data = c_data)
summary(lm_2)
lm_3 <- lm(park ~ avg_temp  + avg_humidity, data = c_data)
summary(lm_3)

# -----------회귀모델 평가-----------
# 다중공선성 & AIC확인(Std. Error이 낮긴해도) -> 다중공선성 가능성 확인인
vif(lm_1)
vif(lm_2)
vif(lm_3)

# AIC가 가장작은 모델 찾기(기존 사용하던 모델이 가장 best)
step(lm_1, direction = "both", scope = (~ avg_temp + avg_humidity))
step(lm_2, direction = "both", scope = (~ avg_temp + avg_humidity))
step(lm_3, direction = "both", scope = (~ avg_temp + avg_humidity))

# -----------로지스틱회귀분석-----------
# 종속변수 재설정
c_data$avg_temp01 <- ifelse((c_data$avg_temp >= 20 & c_data$avg_temp <= 30), 1, 0) # 모기가 자주 발생하는 온도(20~30)
c_data$precipitation01 <- ifelse((c_data$precipitation >= 0.1), 1, 0)
c_data$avg_humidity01 <- ifelse((c_data$avg_humidity >= 50 & c_data$avg_humidity <= 80), 1, 0) # 모기가 자주 발생하는 습도(50~80)
c_data$waterfront01 <-  ifelse(c_data$waterfront >= 1, 1,0)
c_data$residence01 <-  ifelse(c_data$residence >= 1, 1,0)
c_data$park01 <-  ifelse(c_data$park >= 1, 1,0)

# 분석진행(수변부, 주거지, 공원)
glm_1 <- glm(waterfront01 ~ avg_temp01 +precipitation01 + avg_humidity01, family = binomial, data = c_data)
summary(glm_1)
glm_2 <- glm(residence01 ~ avg_temp01 + precipitation01 + avg_humidity01, family = binomial, data = c_data)
summary(glm_2)
glm_3 <- glm(park01 ~ avg_temp01 + precipitation01 + avg_humidity01, family = binomial, data = c_data)
summary(glm_3)

# 지수변환 값 산출(수변부, 주거지, 공원)
exp(glm_1$coefficients) #평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 수변부의 모기번식 비율이 4.61배 / 1배 / 0.5배 
exp(glm_2$coefficients) #평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 수변부의 모기번식 비율이 5.14배 / 1배 / 0.5배
exp(glm_3$coefficients) #평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 수변부의 모기번식 비율이 10배 / 1배 / 0.4배

# 지수변환 값 시각화 (비가 올때 안올때 평균기온의 증가로 인한 모기 번식량)
visreg(glm_1, "avg_temp01", by = "precipitation01", gg = TRUE, scale = "response")
visreg(glm_2, "avg_temp01", by = "precipitation01", gg = TRUE, scale = "response")
visreg(glm_3, "avg_temp01", by = "precipitation01", gg = TRUE, scale = "response")

# -----------회귀모델 평가-----------
# 다중공선성 확인
vif(glm_1) #(VIF < 5) -> 다중공선성의 가능성은 낮다고 판단
vif(glm_2) #(VIF < 5) -> 다중공선성의 가능성은 낮다고 판단
vif(glm_3) #(VIF < 5) -> 다중공선성의 가능성은 낮다고 판단

# AIC가 가장작은 모델 찾기 -> (best : 강수량을 제외한 모델)
step(glm_1, direction = "both",
     scope = (~ avg_temp01 + precipitation01 + avg_humidity01)) # (AIC : 977.79 -> 975.79)
step(glm_2, direction = "both",
     scope = (~ avg_temp01 + precipitation01 + avg_humidity01)) # (AIC : 1033.32 -> 1031.32)
step(glm_3, direction = "both",
     scope = (~ avg_temp01 + precipitation01 + avg_humidity01)) # (AIC : 1389.14 -> 1387.16)

# 최적의 모델로 다시 로지스틱회귀분석
glm_4 <- glm(waterfront01 ~ avg_temp01 + avg_humidity01, family = binomial, data = c_data)
glm_5 <- glm(residence01 ~ avg_temp01 + avg_humidity01, family = binomial, data = c_data)
glm_6 <- glm(park01 ~ avg_temp01 + avg_humidity01, family = binomial, data = c_data)

# 지수변환 값 산출(수변부, 주거지, 공원원)
exp(glm_4$coefficients) #평균기온 / 평균 상대습도가 1 증가했을때, 수변부의 모기번식 비율이 4.6배 / 0.5배 
exp(glm_5$coefficients) #평균기온 / 평균 상대습도가 1 증가했을때, 수변부의 모기번식 비율이 5.14배 / 0.5배 
exp(glm_6$coefficients) #평균기온 / 평균 상대습도가 1 증가했을때, 수변부의 모기번식 비율이 10.2배 / 0.4배 

# H-L 적합도 검정(x-squared값이 낮고, p-value값이 높음 -> 매우 적합한 모델)
hoslem.test(x = glm_4$y , y  = fitted(glm_4)) 
hoslem.test(x = glm_5$y , y  = fitted(glm_5))
hoslem.test(x = glm_6$y , y  = fitted(glm_6))

# 매달 첫째날 데이터 가져오기
weather_data$date <- as.Date(weather_data$date)
start_date <- as.Date("2018-01-01")
end_date <- as.Date("2022-12-31")

filtered_data <- weather_data %>%
  filter(date >= start_date & date <= end_date) %>%
  filter(format(date, "%d") == "01")

View(filtered_data)

# 새로운 데이터프레임 만들기
month <- c(1,2,3,4,5,6,7,8,9,10,11,12)
y_2018 <- c(-1.3,-4.0,-0.2,15.6,20.4,23.8,21.9,33.6,25.5,15.4,8.4,5.5)
y_2019 <- c(-5.0,-2.1,6.6,5.5,16.4,18.9,23.9,26.3,23.7,23.1,14.9,4.6)
y_2020 <- c(-2.2,2.6,5.8,11.3,20.2,19.7,21.1,25.3,26.6,18.8,13.7,1.1)
y_2021 <- c(-4.2,5.0,4.7,17.7,10.2,20.2,26.3,27.1,21.4,21.1,12.9,-1.3)
y_2022 <- c(-4.3,-1.3,5.8,9.2,13.4,22.1,26.6,28.6,24.0,20.9,13.1,-5.4)

temp_data <- data.frame(month,y_2018,y_2019,y_2020,y_2021,y_2022, stringsAsFactors = FALSE)

View(temp_data)

# 데이터 재구조화
temp_data <- reshape2::melt(temp_data, id.vars = "month")

# 꺾은선 그래프 생성
ggplot(data = temp_data, aes(x = month, y = value, color = variable)) +
  coord_cartesian(xlim = c(1,12)) + scale_x_continuous(breaks = seq(1,12,1)) +
  coord_cartesian(ylim = c(-5,35)) + scale_y_continuous(breaks = seq(-5,35,5)) +
  annotate("rect", xmin = 5, xmax = 9 , ymin = -5, ymax = 35, alpha = .2, fill="skyblue") +
  geom_line() +
  labs(x = "Month", y = "Temperature", title = "Temperature by Year") +
  scale_color_discrete(name = "Year")
