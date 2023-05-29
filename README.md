## 111-2 Econometrics Final Project

> **Members:** 資管二 邱秉辰 / 經濟一 王愷均

- **研究主題:** 台大學生在不同時間段 Youbike 2.0 的騎乘特徵與影響因素之分析

- **研究方法:**

  - 資料來源：

    - 2022 年 09 月 至 2022 年 12 月 臺北市 Youbike 2.0 租借紀錄

      https://data.gov.tw/dataset/150635

    - 台大校內與周邊的  Youbike 2.0 站點列表與容量

      https://www.youbike.com.tw/region/main/

  - 敘述統計：

    - 看**不同時間點**台大校內及周邊 Youbike 2.0 的騎行特徵
    - 怎麼劃分時間點？

  - 迴歸分析

    - Dependent Variable

      - **該騎乘站點的借車數量** - **該騎乘站點的還車數量**
    - Dependent Variable

      - 天氣（降雨量）
      - 平日 (1)、假日 (0)
      - 該騎乘站點的 Capacity
      - 騎乘終點：校內 (1), 校外 (2)
      - 與（最鄰近）捷運站的距離 -> 回家
      - 與（最鄰近）宿舍的距離 -> 回家
      - 與（最鄰近）系館、教學館的距離 -> 上課
      - 與（最鄰近）體育館的距離 -> 打球
      - 與（最鄰近）圖書館的距離 -> 唸書

- **檔案架構：** (Updated 05/30 00:51 by Benson Chiu)

  ```
  .
  ├── README.md        # Introduction to this project
  ├── final_data
  	  ├── ntu_station_data.csv  # Youbike 2.0 records in our selected range      
      ├── ntu_station_locations.csv  # Locations for each station in selected range     
      └── ntu_station_distances.csv  # Distance for each station pair in selected range
  ├── data_cleaning.ipynb # Python code for data preprocessing
  └── ntu_station_info.txt # The basic information of our selected stations
  
  ```
  
  
  
  
