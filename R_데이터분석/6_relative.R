


# 0. 준비 ------------------------------------------------------------------

  ## 패키지 불러오기
  library(dplyr)
  library(ggplot2)



  ## 예제 데이터 불러오기
  scores = read.csv('data/StudentsPerformance.csv')
    ##! 출처 : http://roycekimmons.com/tools/generated_data/exams

  scores %>% 
    head()
  
  
  
  
  insurance = read.csv('data/insurance.csv')
  insurance %>% 
    head()  
    ##@ 보험금 청구금액(charges) 데이터 
    ##@ 출처 : https://www.kaggle.com/mirichoi0218/insurance

  
  


    

# 1. 수치형 변수의 변환 --------------------------------------------------------------

  ## 순위(Rank)와 백분위(percentile rank) 계산
  insurance %>% 
    mutate( R  = rank(charges, ties.method='random'),
            PR = percent_rank(charges) ) %>% 
    head()

  
    ### 상위 10% 관측치 선택
    insurance %>% 
      mutate( PR = percent_rank(charges) ) %>%
      filter( PR >=0.9 ) %>% head()
  

    
    insurance %>% 
      slice_max(order_by=charges, prop=0.1)

  
    insurance %>% 
      slice_max(order_by=charges, n=10)
  

  ## 최대최소 정규화(MinMax normalization)
  insurance %>% 
    summarise( MIN = min(charges),
               MAX = max(charges))
  

  
  insurance %>% 
    mutate( MINMAX = (charges - min(charges)) / (max(charges) - min(charges))) %>% 
    head()

  
  
  
  
  ## 표준화(standardization)
  insurance %>% 
    mutate( STD = scale(charges)) %>% 
    head()
    ##! scale( ) : 표준화 함수. center, scale 옵션으로 중심화, 척도화 지정 가능
  

  
    ### 상대적인 그룹 평균 계산
    insurance %>% 
      summarise( MEAN = mean(charges) )
    
    insurance %>% 
      group_by(region, smoker) %>% 
      summarise( MEAN = mean(charges) )
    
    
    insurance %>% 
      mutate( charges_C = scale(charges, center=T, scale=F)) %>% 
      group_by(region, smoker) %>% 
      summarise( MEAN = mean(charges),
                 MEAN_R = mean(charges_C))
      ###! 중심화한 변수를 활용해 전체 평균 대비 상대적인 평균 비교 가능
  

    
      ### mutate()만  활용한 중심화
      insurance %>% 
        mutate( charges_C = charges - mean(charges) ) %>% head()
      
      insurance %>% 
        group_by(region) %>% 
        mutate( charges_C = charges - mean(charges) ) %>% head()
        ###! 그룹 평균을 활용한 중심화도 가능
      
      

      
      
    
  ##! 실습 (scores 데이터 활용)
  ##! math.score의 최대최소 정규화 후 0.9 이상인 관측치만 선택
  ##! parental.level.of.education별 writing.score의 전체 평균 대비 평균 차이 계산 
  
    
    scores %>% 
      summarise(MIN=min(math.score),
              MAX=max(math.score))
    
    scores %>% 
      mutate(MINMAX=(math.score-min(math.score))/(max(math.score)-min(math.score))) %>% 
      filter(MINMAX>=0.9) %>% head()
    
    scores %>% 
      mutate(writing.score_C=writing.score-mean(writing.score)) %>% 
      group_by(parental.level.of.education) %>% 
      summarise(MEAN=mean(writing.score),
                MEAN_R=mean(writing.score_C),
                N=n())
    
    

# 2. 비율의 계산과 시각화 ----------------------------------------------------------

  ## R 기본함수를 활용한 교차표의 생성과 활용
  t1 = table(insurance$smoker, insurance$sex)
  t1
  
  prop.table(t1)
    ##! prop.table( ) : 교차표의 상대빈도(비율) 계산
  
  prop.table(t1, margin=1)
  prop.table(t1, margin=2)
    ##! margin=1 : 행백분율 계산
    ##! margin=2 : 열백분율 계산
  
  
  
    ### dplyr과 Groups 속성
    insurance %>% 
      group_by(smoker, sex)
      ###! tibble : dplyr에서 활용하는 데이터 출력 형식
      ###! group_by( ) : "Groups"라는 이름으로 그룹이 지정된 데이터 생성
    
    
    insurance %>% 
      group_by(smoker, sex) %>% 
      mutate( MINMAX = (charges - min(charges)) / (max(charges) - min(charges))) %>% 
      head()
      ###! "Groups"별로 파생변수 만들고 "Groups"는 유지
    
    
    insurance %>% 
      group_by(smoker, sex) %>% 
      summarise( N = n(),
                 MEAN = mean(charges) )
      ###! "Groups"별로 집계하고 "Groups" 중 마지막 변수 탈락
    
  
    insurance %>% 
      group_by(smoker, sex) %>% 
      summarise( N = n(),
                 MEAN = mean(charges) ) %>% 
      ungroup()
      ###! ungroup( ) : Groups 속성 제거. 그룹 미활용
    
    
    
    
  ## group_by( )와 mutate( )를 활용한 비율 계산
  insurance %>% 
    group_by(smoker, sex) %>% 
    summarise( N = n() )
    ##! 변수/관측치 형태의 요약 결과 생성
  
  
  insurance %>% 
    group_by(smoker, sex) %>% 
    summarise( N = n() ) %>% 
    mutate( P = N / sum(N) )
    ##! sum(N) : "Groups"별 합계
    ##! N/sum(N) : "Groups" 내 해당 수준의 비율 계산
    ##! "흡연여부별 성비"
  
  
  insurance %>% 
    group_by(smoker, sex) %>% 
    summarise( N = n() ) %>% 
    group_by(sex) %>% 
    mutate( P = N / sum(N) )
    ##! 필요에 따라 특정한 그룹 변수 재지정 
    ##! "성별 흡연율" 
  
  
  insurance %>% 
    group_by(smoker, sex) %>% 
    summarise( N = n() ) %>% 
    ungroup() %>% 
    mutate( P = N / sum(N) )
    ##! 필요에 따라 그룹 지정 해제
    ##! "전체 관측치 중 각 수준 조합의 비율" 
  
  
  
  
  ## 비율의 시각화
  agg = insurance %>% 
    mutate( bmi_grp = cut(bmi, 
                          breaks = c(0, 30, 40, 100),
                          labels = c('A','B','C'),
                          right = F)) %>% 
    group_by(bmi_grp, region) %>% 
    summarise( N = n() ) 
  agg
  

    
  
  agg2 = agg %>% 
    group_by(region) %>% 
    mutate( P = N / sum(N) )
  agg2
    ##! "지역별 비만도 그룹 구성비"
  
  
  
  agg2 %>% 
    ggplot(aes(region, bmi_grp, fill=P)) + 
    geom_tile() +
    scale_fill_gradient(low='white', high='red')
    ##! 열지도
  

  
  
  agg2 %>% 
    ggplot(aes(region, P, fill=bmi_grp)) + 
    geom_col()
    ##! 막대그래프 
    ##! position='stack' : 기본값. 쌓아올린 막대그래프
  

  
  
  
    ### 파생변수없이 동일한 그래프 그리기 
    agg %>% 
      ggplot(aes(region, N, fill=bmi_grp)) + 
      geom_col(position='fill')
      ###! position='fill' : 상대도수로 변환한 막대그래프

    
    
    
  ##! 실습 (scores 데이터 활용)
  ##! math.score를 0~60(C), 61~80(B), 81~100(A) 세 개 구간으로 구간화
  ##! parental.level.of.education, race.ethnicity별 점수그룹별 관측치 비중 계산 
  ##! 막대그래프로 비중을 표현(fill 옵션 혹은 facet_wrap( ) 활용)
  ##! filter( )로 점수구간 A만 선택 후 열지도로 시각화
    

    m1=scores %>% 
      mutate(ma_c=cut(math.score,
                      breaks=c(0,60,80,100),
                      labels=c('C','B','A'),
                      right=F)) %>% 
      group_by(parental.level.of.education,race.ethnicity,ma_c) %>% 
      summarise(N=n()) %>% 
      mutate(P=N/sum(N))
    
    
    m1

    m1 %>% 
      ggplot(aes(parental.level.of.education,P,fill=ma_c))+
      geom_col()+
      facet_wrap(vars(race.ethnicity))
    
    m1 %>% 
      filter(ma_c=='A') %>% 
      ggplot(aes(parental.level.of.education,race.ethnicity,fill=P))+
      geom_tile()+
      scale_fill_distiller(palette='YlGnBu',direction=1)
    
# End of script
