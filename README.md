# Data_Compile_Analysis

### 필요한 라이브러리 호출
library(ggplot2)<br>
library(dplyr)<br>
library(tidyr)<br>
library(psych)<br>
library(car)<br>
library(visreg)<br>
library(corrplot)<br>
library(ggcorrplot)<br>
library(ResourceSelection)<br>
library(PerformanceAnalytics)<br>

### 사용할 csv파일을 불러오기
mosq_data <- read.csv("C:/Users/k/Desktop/학교자료/4학년1학기/데이터수집및분석/프로젝트/서울시_모기예보제_정보.csv",
                         header = TRUE, stringsAsFactors = TRUE, sep = ",", fileEncoding = 'euc-kr')<br>
weather_data <- read.csv("C:/Users/k/Desktop/학교자료/4학년1학기/데이터수집및분석/프로젝트/OBS_ASOS_DD.csv",
                         header = TRUE, stringsAsFactors = TRUE, sep = ",", fileEncoding = 'euc-kr')<br>
View(mosq_data)<br>
View(weather_data)

### 필요없는 열을 제거
weather_data <- weather_data[,-(1:2)]<br>

### 사용하기 쉽게 열이름을 변경 <br> (날짜, 평균기온, 강수량, 평균상대습도) -> (date, avg_temp, precipitation, avg_humidity)
names(weather_data) <- c('date','avg_temp','precipitation','avg_humidity')<br>
names(weather_data)<br>
names(mosq_data) <- c('date','waterfront','residence','park')<br>
names(mosq_data)<br>

### 동일한 키값으로 두개의 데이터프레임 병합
mg_data <- merge(weather_data,mosq_data,by='date')<br>
View(mg_data)<br>

# -----------EDA전처리-----------
### 중복값 확인 <br> (관측치 값이 같아서 생기는 중복값이 존재)
duplicates <- mg_data %>% duplicated() %>% table()<br>
duplicates<br>

### 결측치 확인 (결측치 존재)
table(is.na(mg_data))<br>

### 결측치값 대체 (관측이 되지 않은 값과 동일하게 0으로 처리)
mg_data$avg_temp <- ifelse(is.na(mg_data$avg_temp), 0 ,mg_data$avg_temp)<br>
mg_data$precipitation <- ifelse(is.na(mg_data$precipitation), 0, mg_data$precipitation)<br>
mg_data$avg_humidity <- ifelse(is.na(mg_data$avg_humidity), 0 ,mg_data$avg_humidity)<br>
mg_data$waterfront <- ifelse(is.na(mg_data$waterfront), 0, mg_data$waterfront)<br>
mg_data$residence <- ifelse(is.na(mg_data$residence), 0, mg_data$residence)<br>
mg_data$park <- ifelse(is.na(mg_data$park), 0, mg_data$park)<br>

table(is.na(mg_data))<br>

# -----------상관관계 분석-----------
### 새로운 데이터프레임 생성 (변수들간의 관계를 확인하기 위해 날짜 데이터컬럼 제거)
c_data <- mg_data[,-1]<br>
View(c_data)<br>

### 결측치 확인
table(is.na(c_data))<br>

### 상관관계 확인 (시각화)
M = cor(c_data)<br>
corrplot(M, method = 'shade', addCoef.col = "black")<br>
![cor](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/3301a7a9-da71-4df6-869d-3aef880e822c)<br>
##### 변수들간의 상관관계를 봤을때 종속변수들과 평균기온의 상관관계가 가장 큰 것을 알 수 있음<br>
##### 두번째로는 종속변수들과 상대습도가 두번째로 큰 상관관계 값을 보여줌<br>
##### 마지막으로 강수량은 mm단위로 측정되다보니 값이 작아 매우 약한 상관관계를 보이고, 사용하기 힘듬<br>

# -----------다중회귀분석-----------
### 분석(수변부, 주거지, 공원)
lm_1 <- lm(waterfront ~ avg_temp  + avg_humidity, data = c_data)<br>
summary(lm_1)<br>
![lm_1](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/209d5a3d-6f97-419f-b7e6-e9394daea175)<br>
##### (R-squared: 0.2593) -> 25%의 설명력 / (p-value: < 2.2e-16) -> 유의미한 모델<br>
##### 평균기온이 1도 증가하면 수변부의 모기가 9마리 증가<br>
##### 평균습도가 1도 증가하면 수변부의 모기가 0.5마리 감소<br><br>
lm_2 <- lm(residence ~ avg_temp + avg_humidity, data = c_data)<br>
summary(lm_2)<br>
![lm_2](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/110badf2-e270-400f-bf02-64af837e0c63)<br>
##### (R-squared: 0.198) -> 19%의 설명력 / (p-value: < 2.2e-16) -> 유의미한 모델<br>
##### 평균기온이 1도 증가하면 거주지의 모기가 8마리 증가<br>
##### 평균습도가 1도 증가하면 거주지의 모기가 0.9마리 감소<br><br>
lm_3 <- lm(park ~ avg_temp  + avg_humidity, data = c_data)<br>
summary(lm_3)<br>
![lm_3](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/0415f62f-d44c-462a-9fbf-568781ce3256)<br>
##### (R-squared: 0.2126) -> 21%의 설명력 / (p-value: < 2.2e-16) -> 유의미한 모델<br>
##### 평균기온이 1도 증가하면 공원의 모기가 9마리 증가<br>
##### 평균습도가 1도 증가하면 공원의 모기가 0.9마리 감소<br><br> 

# -----------회귀모델 평가-----------
### 다중공선성 
vif(lm_1) # (VIF < 5) -> 다중공선성 가능성 낮음<br>
vif(lm_2) # (VIF < 5) -> 다중공선성 가능성 낮음<br>
vif(lm_3) # (VIF < 5) -> 다중공선성 가능성 낮음<br>

### AIC가 가장작은 모델 찾기 -> (기존 사용하던 모델이 가장 best)
step(lm_1, direction = "both", scope = (~ avg_temp + avg_humidity))<br>
step(lm_2, direction = "both", scope = (~ avg_temp + avg_humidity))<br>
step(lm_3, direction = "both", scope = (~ avg_temp + avg_humidity))<br>

# -----------로지스틱회귀분석-----------
### 종속변수 재설정
모기가 자주 발생하는 온도(20°C-30°C)면 1 아니면 0<br>
c_data$avg_temp01 <- ifelse((c_data$avg_temp >= 20 & c_data$avg_temp <= 30), 1, 0)<br>
비가 오면 1 아니면 0<br>
c_data$precipitation01 <- ifelse((c_data$precipitation >= 0.1), 1, 0)<br>
모기가 자주 발생하는 습도(50%-80%)면 1 아니면 0<br>
c_data$avg_humidity01 <- ifelse((c_data$avg_humidity >= 50 & c_data$avg_humidity <= 80), 1, 0)<br>
수변부에 모기가 있으면 1 아니면 0<br>
c_data$waterfront01 <-  ifelse(c_data$waterfront >= 1, 1,0)<br>
거주지에 모기가 있으면 1 아니면 0<br>
c_data$residence01 <-  ifelse(c_data$residence >= 1, 1,0)<br>
공원에 모기가 있으면 1 아니면 0<br>
c_data$park01 <-  ifelse(c_data$park >= 1, 1,0)<br>

### 분석진행(수변부, 주거지, 공원)
glm_1 <- glm(waterfront01 ~ avg_temp01 +precipitation01 + avg_humidity01, family = binomial, data = c_data)<br>
summary(glm_1)<br>
![glm_1](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/2651b488-0a6d-4fa1-bb93-07ca01b93b33)<br>
glm_2 <- glm(residence01 ~ avg_temp01 + precipitation01 + avg_humidity01, family = binomial, data = c_data)<br>
summary(glm_2)<br>
![glm_2](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/687bce95-7f6a-49de-8441-8f611d4cffb1)<br>
glm_3 <- glm(park01 ~ avg_temp01 + precipitation01 + avg_humidity01, family = binomial, data = c_data)<br>
summary(glm_3)<br>
![glm_3](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/a9b8e689-9749-4f53-a486-adb057c7e3bc)<br>

### 지수변환 값 산출(수변부, 주거지, 공원)
exp(glm_1$coefficients)<br>
exp(glm_2$coefficients)<br>
exp(glm_3$coefficients)<br>
![exp_1](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/38ed862c-133e-40f3-aeaa-7bc313d4f564)<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 수변부의 모기번식 비율이 4.61배 / 1배 / 0.5배<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 주거지의 모기번식 비율이 5.14배 / 1배 / 0.5배<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 공원의 모기번식 비율이 10배 / 1배 / 0.4배<br>

### 지수변환 값 시각화 -> (비가 올때 안올때 평균기온의 증가로 인한 모기 번식량 비교)
visreg(glm_1, "avg_temp01", by = "precipitation01", gg = TRUE, scale = "response")<br>
![visreg_glm_1](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/60847a85-f414-4918-8a92-e01fbab6c09e)<br>
visreg(glm_2, "avg_temp01", by = "precipitation01", gg = TRUE, scale = "response")<br>
![visreg_glm_2](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/41f418c3-2225-4fcf-90bc-1f7532705cfb)<br>
visreg(glm_3, "avg_temp01", by = "precipitation01", gg = TRUE, scale = "response")<br>
![visreg_glm_3](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/d0bd29a4-792a-49d0-8fd9-66cd57f6e80c)<br>
##### 비가 올때의 그래프가 안올때의 그래프보다 폭이 넓고 변동이 큼<br>

# -----------회귀모델 평가-----------
### 다중공선성 확인
vif(glm_1) # (VIF < 5) -> 다중공선성 가능성 낮음<br>
vif(glm_2) # (VIF < 5) -> 다중공선성 가능성 낮음<br>
vif(glm_3) # (VIF < 5) -> 다중공선성 가능성 낮음<br>

### AIC가 가장작은 모델 찾기 -> (best : 강수량을 제외한 모델)
step(glm_1, direction = "both",
     scope = (~ avg_temp01 + precipitation01 + avg_humidity01)) # (AIC : 977.79 -> 975.79)  
step(glm_2, direction = "both",
     scope = (~ avg_temp01 + precipitation01 + avg_humidity01)) # (AIC : 1033.32 -> 1031.32)  
step(glm_3, direction = "both",
     scope = (~ avg_temp01 + precipitation01 + avg_humidity01)) # (AIC : 1389.14 -> 1387.16)  

### 최적의 모델로 로지스틱회귀분석 재실시
glm_4 <- glm(waterfront01 ~ avg_temp01 + avg_humidity01, family = binomial, data = c_data)  
glm_5 <- glm(residence01 ~ avg_temp01 + avg_humidity01, family = binomial, data = c_data)  
glm_6 <- glm(park01 ~ avg_temp01 + avg_humidity01, family = binomial, data = c_data)  

### 지수변환 값 산출(수변부, 주거지, 공원원)
exp(glm_4$coefficients)<br>
exp(glm_5$coefficients)<br>
exp(glm_6$coefficients)<br>
![exp_2](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/0fbd1490-54b7-4fdd-8aba-50c539a4683a)<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 수변부의 모기번식 비율이 4.61배 / 0.5배<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 주거지의 모기번식 비율이 5.14배 / 0.5배<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때,원공원의 모기번식 비율이 10.2배 / 0.4배<br>

### H-L 적합도 검정
hoslem.test(x = glm_4$y , y  = fitted(glm_4))<br>
hoslem.test(x = glm_5$y , y  = fitted(glm_5))<br>
hoslem.test(x = glm_6$y , y  = fitted(glm_6))<br>
![hoslem](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/542a233b-d127-4f2d-94ed-038f405ad453)<br>
##### (x-squared값이 낮고, p-value값이 높음 -> 매우 적합한 모델)

### 매달 첫째날 데이터 가져오기 (날씨 데이터 사용)
weather_data$date <- as.Date(weather_data$date)<br>
start_date <- as.Date("2018-01-01")<br>
end_date <- as.Date("2022-12-31")<br>

filtered_data <- weather_data %>% filter(date >= start_date & date <= end_date) %>% filter(format(date, "%d") == "01")<br>

View(filtered_data)<br>

### 새로운 데이터프레임 만들기
month <- c(1,2,3,4,5,6,7,8,9,10,11,12)<br>
y_2018 <- c(-1.3,-4.0,-0.2,15.6,20.4,23.8,21.9,33.6,25.5,15.4,8.4,5.5)<br>
y_2019 <- c(-5.0,-2.1,6.6,5.5,16.4,18.9,23.9,26.3,23.7,23.1,14.9,4.6)<br>
y_2020 <- c(-2.2,2.6,5.8,11.3,20.2,19.7,21.1,25.3,26.6,18.8,13.7,1.1)<br>
y_2021 <- c(-4.2,5.0,4.7,17.7,10.2,20.2,26.3,27.1,21.4,21.1,12.9,-1.3)<br>
y_2022 <- c(-4.3,-1.3,5.8,9.2,13.4,22.1,26.6,28.6,24.0,20.9,13.1,-5.4)<br>

temp_data <- data.frame(month,y_2018,y_2019,y_2020,y_2021,y_2022, stringsAsFactors = FALSE)<br>

View(temp_data)<br>

### 데이터 재구조화
temp_data <- reshape2::melt(temp_data, id.vars = "month")<br>

### 꺾은선 그래프 생성
ggplot(data = temp_data, aes(x = month, y = value, color = variable)) +<br>
  coord_cartesian(xlim = c(1,12)) + scale_x_continuous(breaks = seq(1,12,1)) +<br>
  coord_cartesian(ylim = c(-5,35)) + scale_y_continuous(breaks = seq(-5,35,5)) +<br>
  annotate("rect", xmin = 5, xmax = 9 , ymin = -5, ymax = 35, alpha = .2, fill="skyblue") +<br>
  geom_line() + labs(x = "Month", y = "Temperature", title = "Temperature by Year") +<br>
  scale_color_discrete(name = "Year")<br>
![geom_line](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/1048f664-469d-4235-bf6d-2476e11aec08)<br>
