---
marp: true
title: 2025-12-15-Learn-R-with-AI-APEN
---

# R, Reinvented: Master Data Science with AI as Your Mentor

林協霆，和信治癌中心腫瘤內科部

slido.com #379302

APEN Academy

2025-12-05

---

Join at slido.com#3793012

Presenting with animations, GIFs or speaker notes? Enable our Chrome extension

<!--
Speaker notes:
📣 This is Slido interaction slide, please don't delete it.✅ Click on 'Present with Slido' and the joining instructions will appear when you get to this slide.
-->

---

# 序言

---

Actions: Install tools we are going to use today

R
<https://cran.csie.ntu.edu.tw/>
Quarto
<https://quarto.org/docs/download/>
Positron
<https://positron.posit.co/download.html>

---

## 本節課程講議 <https://bit.ly/learn-r-with-ai>

<https://htlin222.github.io/learn-r-with-ai/>

<https://github.com/htlin222/learn-r-with-ai>

文字版

Repo

---

## Pipeline for Data Science

1.

Grolemund G. R for Data Science (2e). Hadley.nz. Published 2025. Accessed December 8, 2025. <https://r4ds.hadley.nz/>

---

clinical_dataset.csv

---

---

---

---

---

---

---

---

---

---

---

## Environment Setup

若主要目標是進行統計推論、臨床或流行病學研究、需要大量用到現成的統計模型與專門套件，且輸出是論文、報表或內部簡報，則 R 通常有較高的生產力。

---

## The Hard Way is the Easy Way

Young S. The Hard Way is the Easy Way - Scott H Young. Scott H Young. Published May 11, 2020. Accessed December 7, 2025. <https://www.scotthyoung.com/blog/2020/05/11/hard-is-easy/>

---

## Start from a local folder

My Awesome Project

😎

your-scripts.R

clinical_dataset.csv

./ （專案根目錄）

---

## 一個專案實際怎麼樣？

專案根目錄/
├── 01_論文主檔.qmd
├── 02_專案設定.yml
├── 03_資料/
│   ├── 臨床試驗資料.csv
│   └── 縱向追蹤資料.csv
├── 04_分析程式/
│   ├── 生存分析.R
│   ├── 縱向分析.R
│   └── 次群分析.R
├── 05_論文分章/
│   ├── 前言與方法.qmd
│   └── 結果與討論.qmd
└── 06_輸出成品/
    └── 圖表與報告/

【檔案標頭區】
title: "乳癌運動試驗分析示範"
format: html

【文欄位落】
本檔案示範如何在同一份檔案中，同時寫說明文字並執行 R 分析。

【R 程式區塊（輕量示範）】

# 讀取主要試驗資料並做簡單摘要

library(dplyr)
trial <- read.csv("03_資料/臨床試驗資料.csv")
摘要表 <- trial |>
  count（組別）
摘要表  # 在報告中顯示這個表格

【文欄位落】
上表說明各組受試者人數與隨機化是否均衡。

前言與方法.qmd

---

## Reproducibility Best Practices

Highest standard: R4 (Text + Data + Code)
Use GitHub/GitLab for code; Conda/Docker for environments
Follow DOME framework: Data, Optimization, Model, Evaluation
Commit before major AI interventions; use feature branches
Document AI involvement clearly in commit messages

1.

Gundersen OE. The fundamental principles of reproducibility. Philosophical Transactions of the Royal Society A: Mathematical, Physical and Engineering Sciences. 2021;379(2197). doi:<https://doi.org/10.1098/rsta.2020.0210>

<!--
Speaker notes:
Wiley. What is reproducibility in AI and ML research? 2025.
-->

---

---

## Method 1: Posit Cloud

---

---

## Method 2: Positron

---

Audience Q&A

Presenting with animations, GIFs or speaker notes? Enable our Chrome extension

<!--
Speaker notes:
📣 This is Slido interaction slide, please don't delete it.✅ Click on 'Present with Slido' and the questions from your audience will appear when you get to this slide.
-->

---

# 快速入門

---

---

## 這堂課的玩法

我給你一個「任務」
你把任務描述貼給 AI（ChatGPT / Claude / Gemini）
AI 給你程式碼
你貼到 Posit.cloud / Positron 執行
我們一起看結果、理解發生了什麼
你的工作是「問對問題」，不是「寫對程式」。

---

## 任務 1 — 你的第一個程式

📋 複製這段話，貼給 AI：
Prompt
我完全沒學過 R 語言。請給我一段最簡單的 R 程式碼，用內建的套件，讓我可以畫出一個有 5 根柱子的長條圖，每根柱子的高度分別是 10、25、15、30、20。請給我可以直接複製貼上執行的程式碼。
請用英文標示所有 label
⏱️ 3 分鐘後，你應該會在看到一張圖。

---

## 任務 2 — 發生了什麼事？

📋 複製這段話，貼給 AI：
Prompt
請用「教小學生」的方式，解釋你剛剛給我的那段 R 程式碼。每一行在做什麼？什麼是「變數」？什麼是「函數」？
🎯 目標：不用背，但要大概知道 AI 給你的東西是什麼意思。

---

## 任務 3 — 當程式出錯時

📋 如果剛剛有錯誤訊息，複製錯誤訊息，加上這段話貼給 AI：
Prompt
我在 Positron 執行你給的程式碼，出現這個錯誤：
【貼上錯誤訊息】
請告訴我這是什麼意思，以及怎麼修正。
🎯 記住：錯誤訊息是線索，不是你的錯。

---

## 任務 4 — 認識套件

📋 複製這段話，貼給 AI：
Prompt
R 語言裡面的「套件」(package) 是什麼？可以用「手機 App」來比喻嗎？另外，`library()` 這個指令是在做什麼？

---

## 任務 5 — 安裝我們需要的工具

📋 複製這段話，貼給 AI：
Prompt
我要在 R 裡面使用 ggplot2、gtsummary、broom、dplyr 、tidyverse 、report、skimr、這些個套件。請給我安裝這些套件的程式碼，以及安裝完之後怎麼載入它們。
先裝 pak 這個套件，之後用它來安裝其他套件
⏱️ 安裝可能需要 2-3 分鐘，這是正常的。

---

## 支線任務：環境管理

Prompt
有人要我在 R 裡面使用 renv 套件？他有何居心？

---

---

---

---

## 小技巧：先請 AI 學一下套件怎麼用

CRAN (cran.r-project.org) — R 套件官方總倉庫，所有正式套件的家
Bioconductor (bioconductor.org) — 生物資訊學專用套件庫
Tidyverse (tidyverse.org) — 資料科學核心套件群（dplyr、ggplot2 等）
rOpenSci (ropensci.org) — 經同儕審查的科學研究套件
R-universe (r-universe.dev) — 新一代套件搜尋整合平台

請先看看這個網址，
瞭解一下這個套件的用法

---

# 基本概念

開場
快速入門

---

## AI 時代，應該怎麼學寫程式？

💻

📄

📊

---

## 變數與資料型態

1  建立 一個變數 叫做 "年齡"，存放 25
  2  建立 一個變數 叫做 "姓名"，存放 "小明"
  3  建立 一個變數 叫做 "是學生"，存放 真

R 常見的變數與資料型態有哪些？

---

## 流程控制 - 條件判斷

1  IF 如果 （年齡 >= 18） 那麼
  2    顯示 "你是成年人"
  3  ELSE 否則
  4    顯示 "你是未成年人"
  5  結束 IF 如果

以典型臨床資料處理與生物統計分析為例，可以整理幾個常會自然用到流程控制的情境

---

## 流程控制 - 迴圈

1  從 i = 1 到 10 做
  2    顯示 i
  3  結束迴圈
  4  WHILE 當 （還有作業沒寫完） 做
  5     寫作業
  6    檢查是否完成
  7  結束 WHILE 當

---

## 邏輯運算

1  IF 如果 （年齡 >= 18 而且 有駕照） 那麼
  2    顯示👉 "可以開車 🚗"
  3  結束 IF 如果

  4  IF 如果 （是週末 或者 是假日） 那麼
  5    顯示👉  "可以休息 🛏️"
  6  結束 IF 如果

---

## 函數/方法的概念

1  定義 函數 "計算面積"（長，寬）
  2    面積 = 長 × 寬
  3    回傳 面積
  4  結束函數
（之後執行）
  5  結果 = 呼叫 "計算面積"(5, 3)
  6  顯示 結果  // 會顯示 15

R 最常用的 10 大 function（函數）有哪些？

---

## 資料結構 - 陣列/清單

1  建立 清單 "水果" = ["🍎", "🍌", "🍊"]
（操作 1）
  2  FOR 對於 清單中的每個 "水果項目" 做
  3    顯示 水果項目
  4  結束 FOR 對於
（操作 2）
  5  取得 清單【第 2 個】  // 會得到 "🍌"

為什麼 R 的 data.frame 是一等公民

---

## 演算法思維 - 問題拆解

1  找出清單中最大的數字
  2  定義 函數 "找最大值"（數字清單）
  3    最大值 = 數字清單【從第一個開始】
  4    對於 清單中的每個 "數字" 做
  5     如果 （數字 > 最大值） 那麼
  6      最大值 = 數字
  7     結束如果
  8    結束對於
  9    回傳 最大值
10  結束函數

[3, 2, 5, 8, 7, 6]
[3, 2, 5, 8, 7, 6]
[3, 2, 5, 8, 7, 6]
[3, 2, 5, 8, 7, 6]
[3, 2, 5, 8, 7, 6]
[3, 2, 5, 8, 7, 6]

---

## Needleman–Wunsch algorithm

1.

DP-HLS. Ucsd.edu. Published 2021. Accessed December 10, 2025. <https://turakhia.ucsd.edu/DP-HLS/>

---

# 讀取資料

---

## 任務 6 — 讀取 CSV 檔案

📋 複製這段話，貼給 AI：
Prompt
我有一個 CSV 檔案叫做 patient_data.csv，放在【./ 專案根目錄】。
請告訴我：
怎麼讀取這個檔案到 R 裡面
怎麼看前幾筆資料確認有讀成功
請給我可以直接執行的程式碼。
進階技巧：用套件 googlesheets4 從雲端 read_sheet()

---

## 任務 7 — 認識你的資料

📋 複製這段話，貼給 AI：
Prompt
我已經把資料讀進來了，存在一個叫做 `patient_data` 的變數。請給我程式碼，讓我可以：
看這個資料有幾列幾欄
看每個欄位的基本統計（平均、最大、最小等）
看每個欄位是什麼資料類型（數字、文字等）
用 skimr 跟 summary 顯示分析結果

---

## 任務 8 — 理解你看到的東西

📋 把 `summary(patient_data)` 的輸出複製起來，加上這段話貼給 AI：
Prompt
這是我的資料摘要，請幫我解讀每個欄位的意義，以及有沒有什麼需要注意的地方（例如遺漏值、異常值）：
【貼上 summary 輸出】

---

Audience Q&A

Presenting with animations, GIFs or speaker notes? Enable our Chrome extension

<!--
Speaker notes:
📣 This is Slido interaction slide, please don't delete it.✅ Click on 'Present with Slido' and the questions from your audience will appear when you get to this slide.
-->

---

# 產出 Table 1

---

## 任務 9 — Table 1 是什麼？

📋 複製這段話，貼給 AI：
Prompt
在醫學論文裡面，Table 1 通常是什麼？它的目的是什麼？裡面通常會放哪些東西？

---

## 任務 10 — 你的第一個 Table 1

📋 複製這段話，貼給 AI：
Prompt
我有一個 R 資料框叫做 `patient_data`，裡面有這些欄位：
treatment：治療組別（A 或 B）
age：年齡
gender：性別（M 或 F）
los：住院天數
請用 gtsummary 套件幫我做一個 Table 1，依照 treatment 分組，顯示其他變數的描述性統計。請給我可以直接執行的程式碼。

---

## 任務 11 — 加上統計檢定

📋 複製這段話，貼給 AI：
Prompt
剛剛的 Table 1 很棒。請幫我加上 p-value，讓我可以看出兩組之間有沒有統計顯著差異。

---

## 任務 12 — 看懂 gtsummary 的選擇

📋 複製這段話，貼給 AI：
Prompt
gtsummary 在計算 p-value 的時候，是怎麼決定要用什麼統計方法的？例如，什麼時候用 t-test、什麼時候用 Wilcoxon、什麼時候用卡方檢定？

---

## 任務 13 — 匯出你的表格

📋 複製這段話，貼給 AI：
Prompt
我做好了一個 gtsummary 的表格，想存在變數 my_table 裡面。我想要用 officer 把它輸出成 Word 跟 PPT 檔案，方便貼到我的論文。請給我程式碼。
請看 <https://www.rdocumentation.org/packages/officer/versions/0.7.2> 來學習套件的操作

---

## 實作挑戰 ⚡

用你自己的話問 AI：
Prompt
我的資料有 __欄位，我想要看__ 分組的比較...
🎯 目標：產出一個你自己研究可能會用到的 Table 1
⏱️ 10 分鐘

---

Audience Q&A

Presenting with animations, GIFs or speaker notes? Enable our Chrome extension

<!--
Speaker notes:
📣 This is Slido interaction slide, please don't delete it.✅ Click on 'Present with Slido' and the questions from your audience will appear when you get to this slide.
-->

---

# 產生圖片

---

## 任務 14 — 第一個盒狀圖

📋 複製這段話，貼給 AI：
Prompt
我有一個資料框 patient_data`，裡面有 treatment（A 或 B 兩組）和 los（住院天數）。請用 ggplot2 畫一個盒狀圖，比較兩組的住院天數分佈。

---

## 任務 15 — 讓圖變專業

📋 複製這段話，貼給 AI：
Prompt
請幫我美化這個盒狀圖：
加上標題「兩組治療的住院天數比較」
X 軸標籤改成「治療組別」，Y 軸改成「住院天數（天）」
用 jf-openhuninn-2.1.ttf 作為中文字體
請先下載 jf open 粉圓字型
使用 ggsci 的 JAMA 風格
不要顯示圖例（因為 X 軸已經說明了）

ggthemr
hrbrthemes
tvthemes
ggthemes
viridis
scico

---

## 任務 16 — 加上資料點

📋 複製這段話，貼給 AI：
Prompt
我想在盒狀圖上面疊加個別的資料點，讓讀者可以看到實際的分佈。但資料點不要完全重疊，要有一點水平的隨機散開。請修改程式碼。

---

## 任務 17 — 其他類型的圖

📋 選一個你有興趣的，貼給 AI：
選項 A — 長條圖：
請用 ggplot2 畫一個長條圖，顯示 patient_data 裡面 gender 的人數分佈。
選項 B — 散佈圖：
請用 ggplot2 畫一個散佈圖，X 軸是 age，Y 軸是 los，我想看年齡和住院天數有沒有關係。
選項 C — 直方圖：
請用 ggplot2 畫一個直方圖，顯示 los 的分佈。
用 patchwork 把所有 Graph 整合在一起
視情況使用 ggdist / ggtext / ggiraph / ggh4x

---

---

## 任務 18 — 存檔你的圖

📋 複製這段話，貼給 AI：
Prompt
我畫好了一張 ggplot2 的圖，想要存成 PNG 檔案，解析度要夠高可以放在論文裡（300 dpi），大小大約是 8 x 6 英吋。請給我存檔的程式碼。
接著用 svglite 存成 svg 檔 ( 請先下載 svglite)

---

## 實作挑戰 ⚡

用你自己的話問 AI，畫一張你研究可能會用到的圖。
一些靈感：
不同科別的住院天數比較
年齡分佈
某個數值隨時間的變化
⏱️ 10 分鐘

---

Audience Q&A

Presenting with animations, GIFs or speaker notes? Enable our Chrome extension

<!--
Speaker notes:
📣 This is Slido interaction slide, please don't delete it.✅ Click on 'Present with Slido' and the questions from your audience will appear when you get to this slide.
-->

---

# 統計檢定

---

---

## 任務 19 — 讓 AI 選擇統計方法

📋 複製這段話，貼給 AI：
Prompt
上傳你的的 patient_data.csv 給 GPT
我想要比較兩組病人（treatment A vs B）的住院天數（los）有沒有顯著差異。我的資料存在 `patient_data` 裡面。
請幫我：
依變項尺度、組數、配對與常態性，依教科書原則選擇最合適之統計，並簡要說明選擇理由。
給我執行這個檢定的 R 程式碼，用內建的套件優先
告訴我怎麼解讀結果

---

## 任務 20 — 解讀你的結果

📋 把統計檢定的輸出複製起來，加上這段話貼給 AI：
Prompt
這是我的統計檢定結果：
【貼上輸出】
請用白話文解釋這個結果，包括：
兩組有沒有顯著差異
p-value 是什麼意思
這個結果在臨床上可能代表什麼

<!--
Speaker notes:
本研究比較治療組 A（n = 50）與治療組 B（n = 50）之住院天數。A 組平均住院 4.58 天，B 組平均 11.56 天。由於 A 組資料不符合常態分佈假設（Shapiro-Wilk test, p < 0.001），採用 Wilcoxon rank-sum test 進行比較。結果顯示兩組住院天數有顯著差異（p < 0.001），治療 A 組的住院天數顯著短於 B 組，平均差異約 7 天。
-->

---

## 任務 21 — 檢查假設

📋 複製這段話，貼給 AI：
Prompt
剛剛的統計檢定有什麼前提假設？我要怎麼用 R 檢查我的資料有沒有符合這些假設？如果不符合，有什麼替代方法？

---

## 任務 22 — 類別變數的比較

📋 複製這段話，貼給 AI：
Prompt
我想要看 treatment（A vs B）和 gender（M vs F）有沒有關聯。也就是說，A 組和 B 組的男女比例有沒有不同。
請給我適當的統計檢定程式碼，並教我怎麼解讀。

---

## 任務 23 — 存活分析

📋 複製這段話，貼給 AI：
Prompt
請看這組 time-to-event 的資料，做存活分析，看到生存資料時，先檢查：
① 是否有 competing risks（互斥終點）② 是否有 recurrent events 或 multi-state 轉換③ 暴露／關鍵共變項是否 time-varying 或藏 immortal time④ 是否有遲入、可能 informative censoring 或 center/doctor cluster，然後依檢查結果決定是否需用 CIF/cause-specific/Fine–Gray、recurrent/multi-state、time-dependent Cox、left truncation、IPCW、frailty 或 cluster-robust SE 做方法調整。
請給我適當的統計檢定程式碼，並教我怎麼解讀。

---

## How to pick a survival analysis method?

是不是 time-to-event？不是就回傳統 GLM。
有沒有互斥終點截斷這個事件？
有 → competing risks（CIF + cause-specific / Fine–Gray）。
同一人會不會多次發生這個事件，而且「次數」重要？
有 → recurrent events。
是否在講多個臨床狀態與轉移路徑？有 → multi-state。
暴露／關鍵 covariate 隨時間出現或改變，或需要先活一段時間才能算暴露？
有 → time-dependent / trial emulation，防 immortal time。
入隊時間、離隊（censoring）、中心/醫師，是否明顯和預後相關或構成分群？
有 → left truncation、IPCW / joint、cluster-robust 或 frailty。

---

Audience Q&A

Presenting with animations, GIFs or speaker notes? Enable our Chrome extension

<!--
Speaker notes:
📣 This is Slido interaction slide, please don't delete it.✅ Click on 'Present with Slido' and the questions from your audience will appear when you get to this slide.
-->

---

# 跋語

---

## 任務 24 — 完整的分析流程

📋 複製這段話，貼給 AI：
Prompt
請幫我寫一個完整的 R script，從頭到尾做完以下分析：
讀取 patient_data.csv
用 gtsummary 產出 Table 1（依照 treatment 分組，含 p-value）
用 ggplot2 畫一個比較兩組 los 的盒狀圖
做統計檢定比較兩組 los
把表格存成 Word 檔、圖存成 PNG 檔
請把程式碼整理成一個可以從頭跑到尾的 script，並加上註解說明每一步在做什麼。

---

## 任務 25 - R 生成文字報告

📋 複製這段話，貼給 AI：
Prompt
所有統計分析結果必須以純文字形式輸出，使用 capture.output() 或 sink() 將結果儲存至 report.txt。優先使用 report 和 broom 套件產生可讀的摘要

1 sink("report.txt")
 2 print(summary(model))
 3 print(report::report(model))
 4 print(broom::tidy(model))
 5 sink()

---

## 任務 26 - R 生成文字報告

📋 複製這段話，貼給 AI：
Prompt
請將以下結構化的報告，用英文改寫成我的研究中 Result 的一個描述段落

---

## 任務 27 — 做成你的範本

📋 複製這段話，貼給 AI：
Prompt
請把剛剛的 script 改成一個「範本」，把檔案名稱、分組變數、要分析的變數都用清楚的變數名稱標示在最上面，這樣我以後只要改最上面的設定，就可以套用到不同的資料。

---

## 任務 28 — 保存環境

先用 renv::dependencies() 靜態掃描專案抓出所有第三方套件名稱，再用 packageVersion()（或 sessioninfo::session_info()）對這些套件逐一展開並記錄完整的版本號與環境資訊。 （ 請給我完整的程式碼）

1  Package Version
  2  dplyr  1.1.4
  3  ggplot2 3.5.1
  4  survival 3.7-0
  5  lme4   1.1-35.4
  6  ...

所有統計分析與資料處理皆使用 R 軟體（R version 4.5.1）。分析程式碼之套件相依性以 renv 套件（版本 x.x.x）掃描整個專案目錄而得；除 base/recommended 套件外，本研究主要使用 dplyr（資料前處理）、ggplot2（資料視覺化）、lme4（線性混合效果模型）、survival（生存分析）等套件。完整之套件列表與版本資訊依 sessioninfo::session_info() 輸出，附於補充資料。

---

## 當你離開這個教室之後

📋 複製這段話，貼給 AI：
Prompt
我是一個剛學 R 的醫護人員，主要想用 R 做臨床研究的統計分析。請推薦我：
3 個最值得學的 R 技能（以我的需求來說）
2 個適合初學者的免費學習資源
當我遇到問題時，除了問你之外，還可以去哪裡找答案

---

## 今天你學會的

把問題描述清楚，讓 AI 幫你寫程式
看懂 AI 給的程式碼大概在做什麼
當程式出錯，知道怎麼問 AI 修正
產出可以放進論文的表格和圖表
有一個可以重複使用的分析範本
你不需要記住任何語法。

---

Audience Q&A

Presenting with animations, GIFs or speaker notes? Enable our Chrome extension

<!--
Speaker notes:
📣 This is Slido interaction slide, please don't delete it.✅ Click on 'Present with Slido' and the questions from your audience will appear when you get to this slide.
-->

---

## Thank You

Have a Nice Day

Questions and discussion welcome
Course materials available at: bit.ly/learn-r-with-ai
Contact: <hsieh.ting.lin@gmail.com>
Remember: Verify everything. Disclose transparently. Write ethically.

---

Audience Q&A

Presenting with animations, GIFs or speaker notes? Enable our Chrome extension

<!--
Speaker notes:
📣 This is Slido interaction slide, please don't delete it.✅ Click on 'Present with Slido' and the questions from your audience will appear when you get to this slide.
-->
