## 📌 목차
1. [🖥️ 프로젝트 개요](#%EF%B8%8F-프로젝트-개요)
2. [🗂️ 프로젝트 범위](#%EF%B8%8F-프로젝트-범위)
3. [📖 사용 라이브러리](#-사용-라이브러리)
4. [⚙️ 프로세스](#%EF%B8%8F-프로세스)
5. [📊 결과물](#-결과물)
6. [🗃️ 자료](#%EF%B8%8F-자료)
7. [✏️ 코드 설명](#%EF%B8%8F-코드-설명)
<br>

## 🖥️ 프로젝트 개요
### :calendar: 분석 기간
  - 2023.05.09 ~ 2023.05.30(총 3주)

### 🧑‍🤝‍🧑 인원
  - 3명 (팀 프로젝트 진행)

### 🔖프로젝트 소개

> ***기상 정보를 활용한 모기지수 분석 및 예측***

#### ✅ 추진 배경
- 기후 변화와 도시화로 인해 모기의 서식 환경이 변화하고, 이에 따라 모기 발생 빈도와 종류가 증가
- 모기는 단순한 불편함을 초래할 뿐만 아니라, 다양한 질병의 매개체로 건강을 위협
- 기상정보를 활용하여 모기 발생을 예측해 시민의 건강을 보호하고, 모기 방제 정책을 효과적으로 수립

#### ✅ 목적
- 데이터를 활용하여 모기 발생에 영향을 미치는 기상 요인을 분석하고, 이를 기반으로 모기 빈도수를 예측 
- 기온, 습도, 강수량 등 기상 요인이 모기 발생에 미치는 영향을 분석하여, 모기 발생의 주요 원인을 규명
- 분석 결과를 바탕으로 모기 방제 정책 및 예방 조치 마련


#### ✅ 기대효과 
- #### 모기 발생 예측 정확도 향상
  >- 기상정보를 활용한 예측 모델을 통해 모기 발생 예측의 정확도를 높여, 시민들에게 보다 신뢰할 수 있는 정보를 제공

- #### 효율적인 자원 배분
  >- 모기 발생 예측을 통해 사전 예방 조치를 취할 수 있어, 모기 매개 질병의 발생을 줄이고 시민의 건강을 보호하는 데 기여

- #### 사회적 비용 절감
  >- 모기 방제 활동에 필요한 자원을 효율적으로 배분할 수 있어, 방제 비용을 절감하고 효과적인 방제 전략을 수립

- #### 기후 변화 대응
  >- 기후 변화에 따른 모기 발생 패턴의 변화를 이해하고, 이에 대한 대응 방안을 마련함으로써 지속 가능한 도시 환경을 조성하는 데 기여

<br>

[📌 목차로 이동](#-목차)
<br><br>

## 🗂️ 프로젝트 범위
<div style="text-align: center;">
<table>
<tr><th>과제 구분</th><th>내용</th></tr>
<tr><td rowspan="5" align='center'>회귀분석을 통한 모기지수 분석, <br>예측모델 구현 및 시각화</td><td align='center'>원시 데이터 수집 및 데이터셋 구축</td></tr>
<tr><td align='center'>데이터 전처리, 표준화, 상관관계 분석</td></tr>
<tr><td align='center'>예측모델 선정 및 학습</td></tr>
<tr><td align='center'>AIC, H-L적합도 등 평가지표를 활용한 모델 성능 평가</td></tr>
</table>
</div><br>

[📌 목차로 이동](#-목차)
<br><br>

## 📖 사용 라이브러리
|라이브러리|기능|설명|
|:---:|:---:|:---:|
|car|회귀 분석 및 일반화 선형 모델|진단 도구와 통계적 테스트를 제공|
|tidyr|데이터 정리|데이터의 구조를 정리하여 분석하기 쉽게 만듬|
|dplyr|데이터 조작|데이터 프레임을 필터링, 정렬, 변형하는 작업|
|psych|통계 분석|기술 통계, 신뢰도 분석, 요인 분석 등을 수행|
|visreg|회귀 모델의 시각화|회귀선과 예측 구간을 시각적으로 표현|
|ggplot2|데이터 시각화|다양한 유형의 그래프를 생성|
|corrplot|상관 행렬을 시각화|상관계수를 시각적으로 표현|
|ggcorrplot|ggplot2 기반의 상관 행렬 시각화|상관계수를 시각적으로 표현|
|ResourceSelection|적합성 평가|로지스틱 회귀 모델의 적합성을 평가|
|PerformanceAnalytics|성과 분석|성과 지표를 계산하고 시각화|
<br>

[📌 목차로 이동](#-목차)
<br><br>

## ⚙️ 프로세스
- #### 데이터 수집
  >- 서울열린데이터광장 서울시 모기지수 정보(일별)
  >- 기상자료 개방포털 서울시 기상관측 데이터(일별)
- #### 데이터 전처리
  >- 데이터 표준화 및 전처리(결측치, 이상치 처리)
  >- 변수를 표준화 및 정규화하여 모델학습 효율성을 향상
  >- 상관관계 분석을 통해 독립변수 간의 관계를 확인
- #### 데이터 모델링
  >- 모델 성능 평가를 위해 AIC, H-L적합도, 다중공선성 등의 지표를 사용
- #### 데이터 예측
  >- 다양한 기상요인에 따른 주변부, 수변부 모기지수 예측
- #### 결과 시각화 및 분석
  >- 기상요인에 따른 모기지수 증가 예측
  >- 예측결과에 대한 분석 결과를 그래프로 시각화
  >- 기상요인에 따른 모기지수 예측을 통한 운영 효율성 향상 및 환경적 기여

<br>

[📌 목차로 이동](#-목차)
<br><br>

## 📊 결과물
<details>
  <summary><b>1. 데이터 수집</b> (👈 Click)</summary>
  <br>
  <li>
    서울시 모기예보제 데이터 : 2020년
  </li>
  <li>
    서울시 기상관측 일병 기상 데이터 : 2020년
  </li><br>

  |모기예보제 데이터|기상관측 데이터|
  |:---:|:---:|
  |<img src="https://github.com/user-attachments/assets/67834d90-4fb1-4136-b458-f6dcc391cfee" width="300" alt="데이터1">|<img src="https://github.com/user-attachments/assets/6ea6dcf7-7ac0-49d3-9f5d-a42db6b87781" width="300" alt="데이터2">|
  <br>
</details>
<details>
  <summary><b>2. 데이터 전처리</b> (👈 Click)</summary>
  <br>
  <ol>
    <li>
      데이터 병합
    </li><br>
    <img src="https://github.com/user-attachments/assets/16989ded-303c-4f63-b5d6-756c56a04920" alt="히트맵"><br><br>
    <li>
      데이터 전처리
    </li>
    <ul>
      <li>
        중복값 확인
      </li><br>
      <img src="https://github.com/user-attachments/assets/dca2af76-9198-46d8-bc2f-25835c55eb92" alt="결측치"><br><br>
      <li>
        결측치 확인 및 제거
      </li><br>
      <img src="https://github.com/user-attachments/assets/5c593551-27b8-4012-9166-351906723d1f" alt="분포도"><br><br>
    </ul>
    <li>
      데이터 상관관계(Heatmap)
    </li><br>
    <img src="https://github.com/user-attachments/assets/061d051a-bd5a-490c-bd3d-23e1427465b6" width="400" alt="히트맵"><br>
  </ol>
</details>
<details>
  <summary><b>3. 데이터 분석 </b> (👈 Click)</summary>
  <br>
  <ul>
  <li>다중 회귀 분석</li>
    <ol>
    <li>회귀계수 비교</li>
    <ul>
      <li>평균기온이 가장 유의미하고, 일강수량이 가장 무의미한 것을 확인 </li><br>
      <img src="https://github.com/user-attachments/assets/a56776ab-80f2-4a0f-a7d1-8947d91f3fe1" alt="모델 선정">
    </ul>
    <li>분석 결과</li>
    <ul>
      <li>모든 회귀계수가 유의미한 것을 확인</li>
      <li>R-squared : 0.2328 => 설명력이 다소 부족함</li>
      <li>p-value < 0.05 => 모델이 유의함</li><br>
      <img src="https://github.com/user-attachments/assets/1b03ffef-b167-41f4-b80e-d3a0045b27d6" alt="모델 학습"><br><br>
      <li>평균기온, 합계일사랴은 VIF < 2 이므로 다중공선성 영향이 거의 없음</li>
      <li>평균상대습도는 2 < VIF< 5 이므로 주의가 필요함</li><br>
      <img src="https://github.com/user-attachments/assets/a636c290-e97f-4033-bf33-c1b27fbe47e8" alt="모델 시각화"><br>
    </ul>
    <li>시각화</li>
    <ul>
      <li>회귀선, 상관계수, 검정값 시각화</li><br>
      <img src="https://github.com/user-attachments/assets/65cf8f9a-f3f5-44d0-a2a5-5d8bd4d24aab" alt="선 그래프"><br><br>
    </ul>
  </ol>
  <li>로지스틱 회귀 분석</li>
    <ol>
    <li>분석</li>
    <ul>
      <li>분류를 위해 종속변수를 0,1로 변환</li><br>
      <img src="https://github.com/user-attachments/assets/b896d19c-4d87-4850-b893-c94c957a9fe0" alt="모델 선정">
      <li>로지스틱 회귀분석 진행</li><br>
      <img src="https://github.com/user-attachments/assets/bab1b9b9-076a-4a79-a49c-b2311cc2aba4" alt="모델 선정">
      <li>결과 출력</li><br>
      <img src="https://github.com/user-attachments/assets/f1f3f3df-6268-4d7a-8471-686f063bd947" alt="모델 선정">
    </ul>
    <li>분석 결과</li>
    <table>
    <tr>
    <td align='center'>수변부 분석 결과</td>
    <td align='center'>주거지 분석 결과</td>    
    </tr>
    <tr>
    <td align='center'><img src="https://github.com/user-attachments/assets/f9297330-e403-41c1-bba7-eff648187f52" width="300" alt="데이터1"></td>
    <td align='center'><img src="https://github.com/user-attachments/assets/e4a251bf-46fc-444b-87f5-fb2562d38f35" width="300" alt="데이터2"></td>
    </tr>
    </table>
    <ul>
    <li>목적변수가 1이 될 확률을 높이는 요인 : '평균기온', '일강수량'</li>
    <li>목적변수가 0이 될 확률을 높이는 요인 : '평균상대습도', '합계일사량'</li><br>
    <img src="https://github.com/user-attachments/assets/a9738cfb-0cc8-4213-9c45-9e8d59b0acf5" width="400" alt="fata1"><br>
    </ul>
    <li>번식 비율 예측</li>
    <ul>
      <li>지수변환 값 산출</li>
      <ul>
        <li>전체 설명 변수 값이 0일 때, 모기 번식 비율 <br>수변부 : 17.002% / 주거지 : 28.87%</li>
        <li>평균기온, 일강수량이 증가했을때 모기 번식 비율<br>수변부 : 1.14% (평균기온), 1.10% (일강수량) / 주거지 : 1.15% (평균기온), 1.11% (일강수량) </li>
        <img src="https://github.com/user-attachments/assets/74a329a4-477c-44c3-b341-f963ab170890" alt="선 그래프"><br><br>
    </ul>
  </ol>
  </ul>
  
  
  <br>
</details>
<br>

[📌 목차로 이동](#-목차)
<br><br>

## 🗃️ 자료
[[📂 코드 및 자료]](https://drive.google.com/drive/folders/11fWpNJSr0MCjhDuE5qFu2csuIW_nhSTg?usp=sharing)<br>

[📌 목차로 이동](#-목차)

## ✏️ 코드 설명
<details>
  <summary><b>코드 설명 보기</b> (👈 Click)</summary>
  
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

</details><br>

[📌 목차로 이동](#-목차)