# =============================================================================
# 存活分析 (Survival Analysis) with ggsurvfit
# 資料來源: patient_data_for_survival.csv
# =============================================================================
#
# 什麼是存活分析？
# - 用來分析「事件發生的時間」，例如：死亡、復發、出院
# - 可以處理「設限資料」(censored data)：有些病人在研究結束時還沒發生事件
# - 常用於臨床試驗、預後研究
#
# =============================================================================

# =============================================================================
# 第一步：載入套件 (Load packages)
# =============================================================================
# survival: R 內建的存活分析核心套件，提供 Surv()、survfit()、coxph() 等函數
# ggsurvfit: 用 ggplot2 風格繪製漂亮的存活曲線（比傳統 plot 更美觀）
# ggplot2: 繪圖套件，ggsurvfit 的基礎
# dplyr: 資料處理套件，方便做資料篩選、轉換

library(survival)
library(ggsurvfit)
library(ggplot2)
library(dplyr)

# =============================================================================
# 第二步：讀取資料 (Read data)
# =============================================================================
# read.csv() 會把 CSV 檔案讀成一個 data.frame（資料框）
# 存活分析需要的欄位：
#   - time: 追蹤時間（從開始到事件發生或設限的時間）
#   - status: 事件狀態（1 = 事件發生，0 = 設限/未發生）
#   - 分組變數：例如 treatment、stage 等

data <- read.csv("patient_data_for_survival.csv")

# =============================================================================
# 第三步：查看資料結構 (Check data structure)
# =============================================================================
# head(): 顯示前 6 筆資料，快速瀏覽資料長什麼樣子
# str(): 顯示資料結構，包括每個欄位的類型和前幾個值

head(data)
str(data)

# 小提醒：執行存活分析前，請確認：
# 1. time 欄位是數值型 (numeric)
# 2. status 欄位是 0/1 或 1/2 的編碼
# 3. 分組變數最好是 factor 或 character

# =============================================================================
# 第四步：建立 Surv 物件並繪製 Kaplan-Meier 曲線
# =============================================================================
#
# Surv(time, status) 是什麼？
# - Surv() 函數建立一個「存活物件」，告訴 R 哪個是時間、哪個是事件狀態
# - 這個物件是所有存活分析的基礎
#
# survfit2() vs survfit()：
# - survfit2() 是 ggsurvfit 套件提供的，可以直接接 ggsurvfit() 繪圖
# - survfit() 是 survival 套件的原始函數
#
# 公式 Surv(time, status) ~ treatment 的意思：
# - ~ 左邊是「結果變數」（存活時間和狀態）
# - ~ 右邊是「分組變數」（依照什麼來分組比較）
# - ~ 1 表示不分組，看整體的存活曲線
#
# =============================================================================

# ----- 依照 treatment 分組的存活曲線 (Survival curves by treatment) -----

survfit2(Surv(time, status) ~ treatment, data = data) |>
  # ggsurvfit(): 把 survfit2 的結果轉成 ggplot2 圖形
  ggsurvfit() +
  # labs(): 設定圖表標籤（標題、軸標籤）
  labs(
    title = "Kaplan-Meier Survival Curves by Treatment",
    x = "Time (months)",
    y = "Survival Probability"
  ) +
  # add_confidence_interval(): 加上 95% 信賴區間（陰影區域）
  add_confidence_interval() +
  # add_risktable(): 在圖下方加上風險表（顯示各時間點的存活人數）
  add_risktable() +
  # add_pvalue(): 加上 log-rank test 的 p-value
  add_pvalue()

# =============================================================================
# 第五步：依照 stage 分組的存活曲線
# =============================================================================
#
# 這裡我們改用 stage（疾病分期）來分組
# 通常 stage 越高，預後越差，存活曲線會下降得越快
#
# =============================================================================

survfit2(Surv(time, status) ~ stage, data = data) |>
  ggsurvfit() +
  labs(
    title = "Kaplan-Meier Survival Curves by Stage",
    x = "Time (months)",
    y = "Survival Probability"
  ) +
  add_confidence_interval() +
  add_risktable() +
  add_pvalue()

# =============================================================================
# 第六步：Log-rank test 統計檢定
# =============================================================================
#
# Log-rank test 是什麼？
# - 用來比較兩組（或多組）存活曲線是否有統計顯著差異
# - 虛無假設 H0：各組的存活分佈相同
# - p < 0.05 表示各組存活曲線有顯著差異
#
# survdiff() 函數：
# - 輸出包含卡方統計量 (Chisq) 和 p-value
# - 也會顯示各組的觀察事件數 (O) 和期望事件數 (E)
#
# =============================================================================

# ----- Treatment 組別比較 -----
# 比較不同治療組別的存活是否有差異
survdiff(Surv(time, status) ~ treatment, data = data)

# ----- Stage 分期比較 -----
# 比較不同疾病分期的存活是否有差異
survdiff(Surv(time, status) ~ stage, data = data)

# =============================================================================
# 第七步：Cox proportional hazards model（Cox 比例風險模型）
# =============================================================================
#
# Cox 迴歸是什麼？
# - 用來分析多個變數對存活的影響
# - 可以同時控制多個干擾因子（confounders）
# - 輸出 Hazard Ratio (HR)：風險比
#
# Hazard Ratio 解讀：
# - HR = 1：該變數對存活沒有影響
# - HR > 1：該變數增加事件發生的風險（預後較差）
# - HR < 1：該變數降低事件發生的風險（預後較好）
#
# 公式說明：
# Surv(time, status) ~ treatment + age + gender + stage
# - 同時考慮治療組別、年齡、性別、分期對存活的影響
# - 可以得到「調整後」的效果估計
#
# =============================================================================

cox_model <- coxph(
  Surv(time, status) ~ treatment + age + gender + stage,
  data = data
)

# summary() 顯示完整結果：
# - coef: 迴歸係數（log(HR)）
# - exp(coef): Hazard Ratio
# - se(coef): 標準誤
# - z: z 統計量
# - Pr(>|z|): p-value
# - lower .95, upper .95: 95% 信賴區間
summary(cox_model)

# =============================================================================
# 第八步：儲存圖片 (Save plot)
# =============================================================================
#
# ggsave() 函數：
# - 可以把 ggplot2 圖形存成各種格式（PNG、PDF、JPEG 等）
# - width, height: 圖片尺寸（單位：英吋）
# - dpi: 解析度（論文建議用 300 dpi 以上）
#
# 小技巧：
# - 先把圖存到變數 p，再用 ggsave() 存檔
# - 這樣可以確保存的是你想要的那張圖
#
# =============================================================================

# 先建立圖形物件
p <- survfit2(Surv(time, status) ~ treatment, data = data) |>
  ggsurvfit() +
  labs(
    title = "Kaplan-Meier Survival Curves by Treatment",
    x = "Time (months)",
    y = "Survival Probability"
  ) +
  add_confidence_interval() +
  add_risktable() +
  add_pvalue()

# 儲存圖片
# 檔名: survival_curve.png
# 尺寸: 10 x 8 英吋
# 解析度: 300 dpi（適合論文發表）
ggsave("survival_curve.png", plot = p, width = 10, height = 8, dpi = 300)

# =============================================================================
# 補充：常見問題與進階技巧
# =============================================================================
#
# Q1: 如何只顯示特定時間範圍的存活曲線？
# A1: 在 ggsurvfit() 後加上 + coord_cartesian(xlim = c(0, 60))
#
# Q2: 如何改變曲線顏色？
# A2: 加上 + scale_color_manual(values = c("blue", "red"))
#
# Q3: 如何計算特定時間點的存活率？
# A3: 使用 summary(survfit(...), times = c(12, 24, 36))
#
# Q4: Cox 模型的比例風險假設如何檢驗？
# A4: 使用 cox.zph(cox_model) 函數
#
# =============================================================================
