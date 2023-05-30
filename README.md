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
    - (05/30 進度) https://studio.foursquare.com/public/5041dc36-77a7-42ab-9c09-50eb86f7ea67

  - 迴歸分析 (05/31 TBD)

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

- **檔案架構：** (Updated 05/30 22:09 by Benson Chiu)

  ```
  .
  ├── README.md        # Introduction to this project
  ├── final_data.zip   # Datasets used in this project
  ├── data_cleaning.ipynb # Python code for data preprocessing
  ├── data_merging.ipynb # Python code for OD Analysis
  └── ntu_station_info.txt # The basic information of our selected stations
  
  ```
  
  
  
  
