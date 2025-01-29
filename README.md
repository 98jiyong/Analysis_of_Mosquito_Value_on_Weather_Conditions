## 📌 목차
1. [🖥️ 프로젝트 개요](#%EF%B8%8F-프로젝트-개요)
2. [🗂️ 프로젝트 범위](#%EF%B8%8F-프로젝트-범위)
3. [📖 사용 라이브러리](#-사용-라이브러리)
4. [⚙️ 프로세스](#%EF%B8%8F-프로세스)
5. [📊 결과물](#-결과물)
6. [🗃️ 자료](#%EF%B8%8F-자료)
<br>

## 🖥️ 프로젝트 개요
### :calendar: 분석 기간
  - 2025.01.02 ~ 2025.01.07(총 5일)

### 🧑‍🤝‍🧑 인원
  - 1명 (개인 프로젝트 진행)

### 🔖프로젝트 소개

> ***기상 정보를 활용한 공공자전거 수요분석 및 예측***

#### ✅ 추진 배경
- 공공자전거 이용의 증가와 함께, 기상정보를 활용한 수요 예측의 필요성이 점차 커지고 있음
- 기상정보는 자전거 이용에 직접적인 영향을 미치는 요소로 다양한 기상 변수들이 자전거 이용자의 선택에 영향을 줄 수 있음
- 공공자전거 시스템의 효율성을 높이기 위해, 기상정보를 활용하여 수요를 예측하고, 자전거 대여소의 운영 및 관리에 대한 전략을 수립하고자 함

#### ✅ 목적
- 운영 효율성을 높이고 경제적 이익을 극대화할 수 있는 방안을 모색
- 효과적인 환경 관리 정책 및 전략을 수립할 수 있도록 지원하며, 지속 가능한 발전을 위한 실질적인 방안을 제시

#### ✅ 기대효과 
- #### 자원 관리 효율성 증대
  >- 기상정보를 활용하여 자전거 수요를 예측하고, 효율적으로 배치함으로써 자원 낭비 감소
  >- 예측을 통해 유지보수 시기를 적절히 조정하여 자전거의 가용성을 높이고, 운영 비용을 절감

- #### 환경적 효과
  >- 공공자전거 이용이 증가함에 따라 자동차 이용이 줄어들고, 이는 대기 오염 감소에 기여

- #### 사회적 비용 절감
  >- 자전거 이용이 증가함에 따라 도로의 교통 혼잡이 줄어들고, 이는 교통사고 및 대기 오염을 감소시켜 사회적 비용을 절감
  >- 자전거 이용이 증가함에 따라 시민들의 신체 활동이 늘어나고, 이는 건강 증진 및 의료비 절감  

<br>

[📌 목차로 이동](#-목차)
<br><br>

## 🗂️ 프로젝트 범위
<div style="text-align: center;">
<table>
<tr><th colspan="2">과제 구분</th><th>내용</th></tr>
<tr><td rowspan="7">AI</td><td rowspan="7" align='center'>AI기반 공공자전거 수요분석, <br>예측모델 구현 및 시각화</td><td align='center'>원시 데이터 수집 및 데이터셋 구축</td></tr>
<tr><td align='center'>데이터 전처리, 표준화, 상관관계 분석 (EDA도구 활용)</td></tr>
<tr><td align='center'>예측모델 선정 및 학습</td></tr>
<tr><td align='center'>MSE, R-Squared 등 평가지표를 활용한 모델 성능 평가</td></tr>
<tr><td align='center'>웹 API 및 프로토타입 구충</td></tr>
<tr><td align='center'>예측모델 시각화 및 웹기반 시스템 구축</td></tr>
<tr><td align='center'>테스트</td></tr>
</table>
</div><br>

[📌 목차로 이동](#-목차)
<br><br>

## 📖 사용 라이브러리
|라이브러리|모델|기능|설명|
|:---:|:---:|:---:|:---:|
|numpy|-|데이터 수치 계산|데이터의 수치적 연산 수행|
|pandas|-|데이터 조작 및 분석|데이터 읽기, 쓰기, 필터링 등을 지원|
|matplotlib|-|데이터 시각화|다양한 유형의 그래프 제공|
|seaborn|-|Matplotlib기반 시각화|통계적 그래프 시각화 지원|
|sklearn|train_test_split|머신러닝|데이터를 훈련, 테스트 세트로 분류|
|sklearn|r2_score|머신러닝|결정 계수(R²)를 계산|
|sklearn|mean_squared_error|머신러닝|평균 제곱 오차(MSE)를 계산|
|sklearn|StandardScaler|머신러닝|데이터를 표준화|
|sklearn|LinearRegression|머신러닝|선형 회귀 모델을 구현하|
|sklearn|RandomForestClassifier|머신러닝|랜덤 포레스트 분류 모델을 구현|
|sklearn|RandomForestRegressor|머신러닝|랜덤 포레스트 회귀 모델을 구현|
|xgboost|XGBRegressor|회귀 및 분류|XGBoost를 기반으로 한 회귀 모델|
<br>

[📌 목차로 이동](#-목차)
<br><br>

## ⚙️ 프로세스
- #### 데이터 수집
  >- 서울열린데이터광장 서울시 공공자전거 이용정보(일별)
  >- 기상자료 개방포털 서울시 기상관측 데이터(일별)
- #### 데이터 전처리
  >- 데이터 표준화 및 전처리(결측치, 이상치 처리)
  >- 변수를 표준화 및 정규화하여 모델학습 효율성을 향상
  >- 상관관계 분석을 통해 독립변수 간의 관계를 확인
  >- 특성 중요도를 통해 중요도가 낮은 독립변수 제거
- #### 데이터 모델링
  >- 모델 성능 평가를 위해 MSE, r-squared 등의 지표를 사용
  >- 모델 비교 및 최적 모델 도출 (XGBoost 채택)
- #### 데이터 예측
  >- 다양한 기상요인에 따른 공공자전거 수요 예측
- #### 결과 시각화 및 분석
  >- 모델의 정확도 평가를 위해 실제값과 예측값을 비교
  >- 예측결과에 대한 분석 결과를 산점도로 시각화
  >- 실제값과 예측값 간의 차이를 바탕으로 잔차 분석 진행
  >- 기상요인에 따른 공공자전거 수요 예측을 통한 운영 효율성 향상 및 환경적 기여

<br>

[📌 목차로 이동](#-목차)
<br><br>

## 📊 결과물
<details>
  <summary><b>1. 데이터 수집</b> (👈 Click)</summary>
  <br>
  <li>
    서울시 공공자전거 일별 이용 현황 데이터(엑셀) : 2023년
  </li>
  <li>
    서울시 기상관측 일병 기상 데이터(엑셀) : 2023년
  </li>

  |공공자전거 데이터|기상관측 데이터|
  |:---:|:---:|
  |<img src="https://github.com/user-attachments/assets/4101d1ac-1d46-4f9a-9538-00282674518a" width="300" alt="데이터1">|<img src="https://github.com/user-attachments/assets/04e230dc-0a6b-4571-88b9-603fcef82327" width="300" alt="데이터2">|
  <br>
</details>
<details>
  <summary><b>2. 데이터 분석</b> (👈 Click)</summary>
  <br>
  <ol>
    <li>
      데이터 상관관계(Heatmap)
    </li><br>
    <img src="https://github.com/user-attachments/assets/83748058-4db5-4099-b0de-cfedcd2d1416" width="400" alt="히트맵"><br>
    <li>
      탐색적 데이터 분석
    </li>
    <ul>
      <li>
        결측치 및 중복값 통계
      </li><br>
      <img src="https://github.com/user-attachments/assets/fffa7e15-d5b1-407a-a0b8-653b064bb634" alt="결측치"><br><br>
      <li>
        주요 변수별 데이터 분포(Histogram)
      </li><br>
      <img src="https://github.com/user-attachments/assets/7f1327cc-4eb1-4e50-8856-543e1203ff8d" alt="분포도"><br><br>
      <li>
        데이터 전처리
      </li><br>
      <img src="https://github.com/user-attachments/assets/d8bb8085-fcdd-4dfa-b922-99d0044749f3" alt="분포도"><br>
    </ul>
  </ol>
</details>
<details>
  <summary><b>3. 데이터 학습 및 모델정의 </b> (👈 Click)</summary>
  <br>
  <ol>
    <li>예측 모델 선정</li>
    <ul>
      <li>결정계수 비교 : Ensemble 기법 중 하나인 XGBoost 모델 채택</li><br>
      <img src="https://github.com/user-attachments/assets/97b29c7c-8c93-4029-bd20-979bc6023a9b" alt="모델 선정">
    </ul>
    <li>모델 학습 및 시각화</li>
    <ul>
      <li>모델 학습</li><br>
      <img src="https://github.com/user-attachments/assets/c964e95e-fabd-4fab-af88-94468cb5cee4" alt="모델 학습"><br><br>
      <li>학습과정 시각화</li><br>
      <img src="https://github.com/user-attachments/assets/fdfa1423-93c2-4f1b-87e9-cfa683cb59c4" alt="모델 시각화"><br>
    </ul>
    <li>모델 예측</li>
    <ul>
      <li>예측값 vs 실제값 비교</li><br>
      <ul>
        <li>선 그래프 비교</li><br>
        <img src="https://github.com/user-attachments/assets/40662084-42f6-4e33-b72d-55dbb349ac7a" alt="선 그래프"><br><br>
        <li>산점도 분석</li><br>
        <img src="https://github.com/user-attachments/assets/3754e41b-4c30-4133-a514-149e82f98918" alt="산점도"><br><br>
        <li>잔차 분석</li><br>
        <img src="https://github.com/user-attachments/assets/c7cf2f15-b69d-424b-a46d-49bc50297f94" alt="잔차"><br><br>
      </ul>
    </ul>
  </ol>
  
  <br>
</details>
<details>
  <summary><b>4. 프로토타이핑(화면) </b> (👈 Click)</summary>
  <br>
  <ol>
  <li>모델 예측</li>
    <ul>
      <li>기상요인에 따른 공공자전거 이용건수 예측</li><br>
      <img src="https://github.com/user-attachments/assets/e0f4c19b-54a0-4452-a4ec-691b4443678f" alt="모델 예측"><br><br>
    </ul>
  <li>예측 결과</li>
    <ul>
      <li>기상요인에 따른 공공자전거 이용건수 예측</li><br>
      <img src="https://github.com/user-attachments/assets/75bf3c39-3b04-46cc-ae68-db4c27836cf4" alt="예측 자료"><br>
      <img src="https://github.com/user-attachments/assets/ab3156f7-e734-4f08-b18b-a8988d037e64" alt="예측 결과"><br>
    </ul>
  </ol>
</details>
<br>

[📌 목차로 이동](#-목차)
<br><br>

## 🗃️ 자료
[[📂 코드 및 자료]](https://drive.google.com/drive/folders/1LK1ONMXZGfyqcQqXVD0yvlwtoGq23Evx?usp=sharing)<br>

[📌 목차로 이동](#-목차)

<details>
  <summary><b>코드 및 설명</b> (👈 Click)</summary>
  
### 필요한 라이브러리 호출
```
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
```

### 사용할 csv파일을 불러오기
```
mosq_data <- read.csv("./dataset/서울시_모기예보제_정보.csv",
                         header = TRUE, stringsAsFactors = TRUE, sep = ",", fileEncoding = 'euc-kr') 
weather_data <- read.csv("./dataset/OBS_ASOS_DD.csv",
                         header = TRUE, stringsAsFactors = TRUE, sep = ",", fileEncoding = 'euc-kr') 
View(mosq_data) 
View(weather_data)
```

### 필요없는 열을 제거
```
weather_data <- weather_data[,-(1:2)] 
```

### 사용하기 쉽게 열이름을 변경 <br> (날짜, 평균기온, 강수량, 평균상대습도) -> (date, avg_temp, precipitation, avg_humidity)
```
names(weather_data) <- c('date','avg_temp','precipitation','avg_humidity') 
names(weather_data) 
names(mosq_data) <- c('date','waterfront','residence','park') 
names(mosq_data) 
```

### 동일한 키값으로 두개의 데이터프레임 병합
```
mg_data <- merge(weather_data,mosq_data,by='date') 
View(mg_data)
```

# -----------EDA전처리-----------
### 중복값 확인 <br> (관측치 값이 같아서 생기는 중복값이 존재)
```
duplicates <- mg_data %>% duplicated() %>% table() 
duplicates
```

### 결측치 확인 (결측치 존재)
```
table(is.na(mg_data))
```

### 결측치값 대체 (관측이 되지 않은 값과 동일하게 0으로 처리)
```
mg_data$avg_temp <- ifelse(is.na(mg_data$avg_temp), 0 ,mg_data$avg_temp) 
mg_data$precipitation <- ifelse(is.na(mg_data$precipitation), 0, mg_data$precipitation) 
mg_data$avg_humidity <- ifelse(is.na(mg_data$avg_humidity), 0 ,mg_data$avg_humidity) 
mg_data$waterfront <- ifelse(is.na(mg_data$waterfront), 0, mg_data$waterfront) 
mg_data$residence <- ifelse(is.na(mg_data$residence), 0, mg_data$residence) 
mg_data$park <- ifelse(is.na(mg_data$park), 0, mg_data$park)

table(is.na(mg_data))
```
# -----------상관관계 분석-----------
### 새로운 데이터프레임 생성 (변수들간의 관계를 확인하기 위해 날짜 데이터컬럼 제거)
```
c_data <- mg_data[,-1] 
View(c_data)
```

### 결측치 확인
```
table(is.na(c_data))
```

### 상관관계 확인 (시각화)
```
M = cor(c_data) 
corrplot(M, method = 'shade', addCoef.col = "black")
```
![cor](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/3301a7a9-da71-4df6-869d-3aef880e822c)<br>
##### 변수들간의 상관관계를 봤을때 종속변수들과 평균기온의 상관관계가 가장 큰 것을 알 수 있음<br>
##### 두번째로는 종속변수들과 상대습도가 두번째로 큰 상관관계 값을 보여줌<br>
##### 마지막으로 강수량은 mm단위로 측정되다보니 값이 작아 매우 약한 상관관계를 보이고, 사용하기 힘듬<br>

# -----------다중회귀분석-----------
### 분석(수변부, 주거지, 공원)
```
lm_1 <- lm(waterfront ~ avg_temp  + avg_humidity, data = c_data) 
summary(lm_1)
```
![lm_1](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/209d5a3d-6f97-419f-b7e6-e9394daea175)<br>
##### (R-squared: 0.2593) -> 25%의 설명력 / (p-value: < 2.2e-16) -> 유의미한 모델<br>
##### 평균기온이 1도 증가하면 수변부의 모기가 9마리 증가<br>
##### 평균습도가 1도 증가하면 수변부의 모기가 0.5마리 감소<br><br>
```
lm_2 <- lm(residence ~ avg_temp + avg_humidity, data = c_data) 
summary(lm_2)
```
![lm_2](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/110badf2-e270-400f-bf02-64af837e0c63)<br>
##### (R-squared: 0.198) -> 19%의 설명력 / (p-value: < 2.2e-16) -> 유의미한 모델<br>
##### 평균기온이 1도 증가하면 거주지의 모기가 8마리 증가<br>
##### 평균습도가 1도 증가하면 거주지의 모기가 0.9마리 감소<br><br>
```
lm_3 <- lm(park ~ avg_temp  + avg_humidity, data = c_data) 
summary(lm_3)
```
![lm_3](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/0415f62f-d44c-462a-9fbf-568781ce3256)<br>
##### (R-squared: 0.2126) -> 21%의 설명력 / (p-value: < 2.2e-16) -> 유의미한 모델<br>
##### 평균기온이 1도 증가하면 공원의 모기가 9마리 증가<br>
##### 평균습도가 1도 증가하면 공원의 모기가 0.9마리 감소<br><br> 

# -----------회귀모델 평가-----------
### 다중공선성 
```
vif(lm_1) # (VIF < 5) -> 다중공선성 가능성 낮음 
vif(lm_2) # (VIF < 5) -> 다중공선성 가능성 낮음 
vif(lm_3) # (VIF < 5) -> 다중공선성 가능성 낮음
```

### AIC가 가장작은 모델 찾기 -> (기존 사용하던 모델이 가장 best)
```
step(lm_1, direction = "both", scope = (~ avg_temp + avg_humidity)) 
step(lm_2, direction = "both", scope = (~ avg_temp + avg_humidity)) 
step(lm_3, direction = "both", scope = (~ avg_temp + avg_humidity))
```

# -----------로지스틱회귀분석-----------
### 종속변수 재설정
```
# 모기가 자주 발생하는 온도(20°C-30°C)면 1 아니면 0 
c_data$avg_temp01 <- ifelse((c_data$avg_temp >= 20 & c_data$avg_temp <= 30), 1, 0) 
# 비가 오면 1 아니면 0 
c_data$precipitation01 <- ifelse((c_data$precipitation >= 0.1), 1, 0) 
# 모기가 자주 발생하는 습도(50%-80%)면 1 아니면 0 
c_data$avg_humidity01 <- ifelse((c_data$avg_humidity >= 50 & c_data$avg_humidity <= 80), 1, 0) 
# 수변부에 모기가 있으면 1 아니면 0 
c_data$waterfront01 <-  ifelse(c_data$waterfront >= 1, 1,0) 
# 거주지에 모기가 있으면 1 아니면 0 
c_data$residence01 <-  ifelse(c_data$residence >= 1, 1,0) 
# 공원에 모기가 있으면 1 아니면 0 
c_data$park01 <-  ifelse(c_data$park >= 1, 1,0)
```

### 분석진행(수변부, 주거지, 공원)
```
glm_1 <- glm(waterfront01 ~ avg_temp01 +precipitation01 + avg_humidity01, family = binomial, data = c_data) 
summary(glm_1)
```
![glm_1](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/2651b488-0a6d-4fa1-bb93-07ca01b93b33)<br>
```
glm_2 <- glm(residence01 ~ avg_temp01 + precipitation01 + avg_humidity01, family = binomial, data = c_data) 
summary(glm_2)
```
![glm_2](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/687bce95-7f6a-49de-8441-8f611d4cffb1)<br>
```
glm_3 <- glm(park01 ~ avg_temp01 + precipitation01 + avg_humidity01, family = binomial, data = c_data) 
summary(glm_3)
```
![glm_3](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/a9b8e689-9749-4f53-a486-adb057c7e3bc)<br>

### 지수변환 값 산출(수변부, 주거지, 공원)
```
exp(glm_1$coefficients) 
exp(glm_2$coefficients) 
exp(glm_3$coefficients)
```
![exp_1](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/38ed862c-133e-40f3-aeaa-7bc313d4f564)<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 수변부의 모기번식 비율이 4.61배 / 1배 / 0.5배<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 주거지의 모기번식 비율이 5.14배 / 1배 / 0.5배<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 공원의 모기번식 비율이 10배 / 1배 / 0.4배<br>

### 지수변환 값 시각화 -> (비가 올때 안올때 평균기온의 증가로 인한 모기 번식량 비교)
```
visreg(glm_1, "avg_temp01", by = "precipitation01", gg = TRUE, scale = "response")
```
![visreg_glm_1](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/60847a85-f414-4918-8a92-e01fbab6c09e)<br>
```
visreg(glm_2, "avg_temp01", by = "precipitation01", gg = TRUE, scale = "response")
```
![visreg_glm_2](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/41f418c3-2225-4fcf-90bc-1f7532705cfb)<br>
```
visreg(glm_3, "avg_temp01", by = "precipitation01", gg = TRUE, scale = "response")
```
![visreg_glm_3](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/d0bd29a4-792a-49d0-8fd9-66cd57f6e80c)<br>
##### 비가 올때의 그래프가 안올때의 그래프보다 폭이 넓고 변동이 큼<br>

# -----------회귀모델 평가-----------
### 다중공선성 확인
```
vif(glm_1) # (VIF < 5) -> 다중공선성 가능성 낮음 
vif(glm_2) # (VIF < 5) -> 다중공선성 가능성 낮음 
vif(glm_3) # (VIF < 5) -> 다중공선성 가능성 낮음
```

### AIC가 가장작은 모델 찾기 -> (best : 강수량을 제외한 모델)
```
step(glm_1, direction = "both",
     scope = (~ avg_temp01 + precipitation01 + avg_humidity01)) # (AIC : 977.79 -> 975.79)  
step(glm_2, direction = "both",
     scope = (~ avg_temp01 + precipitation01 + avg_humidity01)) # (AIC : 1033.32 -> 1031.32)  
step(glm_3, direction = "both",
     scope = (~ avg_temp01 + precipitation01 + avg_humidity01)) # (AIC : 1389.14 -> 1387.16)
```

### 최적의 모델로 로지스틱회귀분석 재실시
```
glm_4 <- glm(waterfront01 ~ avg_temp01 + avg_humidity01, family = binomial, data = c_data)  
glm_5 <- glm(residence01 ~ avg_temp01 + avg_humidity01, family = binomial, data = c_data)  
glm_6 <- glm(park01 ~ avg_temp01 + avg_humidity01, family = binomial, data = c_data)  
```

### 지수변환 값 산출(수변부, 주거지, 공원원)
```
exp(glm_4$coefficients) 
exp(glm_5$coefficients) 
exp(glm_6$coefficients)
```
![exp_2](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/0fbd1490-54b7-4fdd-8aba-50c539a4683a)<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 수변부의 모기번식 비율이 4.61배 / 0.5배<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때, 주거지의 모기번식 비율이 5.14배 / 0.5배<br>
##### 평균기온 / 일강수량이 / 평균상대습도 1 증가했을때,원공원의 모기번식 비율이 10.2배 / 0.4배<br>

### H-L 적합도 검정
```
hoslem.test(x = glm_4$y , y  = fitted(glm_4)) 
hoslem.test(x = glm_5$y , y  = fitted(glm_5)) 
hoslem.test(x = glm_6$y , y  = fitted(glm_6))
```
![hoslem](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/542a233b-d127-4f2d-94ed-038f405ad453)<br>
##### (x-squared값이 낮고, p-value값이 높음 -> 매우 적합한 모델)

### 매달 첫째날 데이터 가져오기 (날씨 데이터 사용)
```
weather_data$date <- as.Date(weather_data$date) 
start_date <- as.Date("2018-01-01") 
end_date <- as.Date("2022-12-31") 

filtered_data <- weather_data %>% filter(date >= start_date & date <= end_date) %>% filter(format(date, "%d") == "01") 

View(filtered_data) 
```

### 새로운 데이터프레임 만들기
```
month <- c(1,2,3,4,5,6,7,8,9,10,11,12) 
y_2018 <- c(-1.3,-4.0,-0.2,15.6,20.4,23.8,21.9,33.6,25.5,15.4,8.4,5.5) 
y_2019 <- c(-5.0,-2.1,6.6,5.5,16.4,18.9,23.9,26.3,23.7,23.1,14.9,4.6) 
y_2020 <- c(-2.2,2.6,5.8,11.3,20.2,19.7,21.1,25.3,26.6,18.8,13.7,1.1) 
y_2021 <- c(-4.2,5.0,4.7,17.7,10.2,20.2,26.3,27.1,21.4,21.1,12.9,-1.3) 
y_2022 <- c(-4.3,-1.3,5.8,9.2,13.4,22.1,26.6,28.6,24.0,20.9,13.1,-5.4) 

temp_data <- data.frame(month,y_2018,y_2019,y_2020,y_2021,y_2022, stringsAsFactors = FALSE) 

View(temp_data) 
```

### 데이터 재구조화
```
temp_data <- reshape2::melt(temp_data, id.vars = "month") 
```

### 꺾은선 그래프 생성
```
ggplot(data = temp_data, aes(x = month, y = value, color = variable)) + 
  coord_cartesian(xlim = c(1,12)) + scale_x_continuous(breaks = seq(1,12,1)) + 
  coord_cartesian(ylim = c(-5,35)) + scale_y_continuous(breaks = seq(-5,35,5)) + 
  annotate("rect", xmin = 5, xmax = 9 , ymin = -5, ymax = 35, alpha = .2, fill="skyblue") + 
  geom_line() + labs(x = "Month", y = "Temperature", title = "Temperature by Year") + 
  scale_color_discrete(name = "Year")
```
![geom_line](https://github.com/98jiyong/Data_Compile_Analysis/assets/119985920/1048f664-469d-4235-bf6d-2476e11aec08)<br>

</details>
