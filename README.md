# R 語言統計工具入門：用 AI 學會做臨床研究統計

[![GitHub stars](https://img.shields.io/github/stars/htlin222/learn-r-with-ai?style=social)](https://github.com/htlin222/learn-r-with-ai/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/htlin222/learn-r-with-ai)](https://github.com/htlin222/learn-r-with-ai/commits/main)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/htlin222/learn-r-with-ai?quickstart=1)

> 一個以 Quarto 建置的開源教學書籍，教你如何善用 AI 輔助學習 R 語言，完成臨床研究統計分析 -- 從零開始，不需要程式背景。

## 30 秒開始上課

按上面的 **Open in GitHub Codespaces**（或 **Code → Codespaces → Create codespace on main**），
瀏覽器就會開出一台已經裝好一切的機器：

- ✅ R 4.5 + 全部課程套件（gtsummary、ggplot2、survival⋯⋯）
- ✅ Quarto、中文字型、VS Code 的 R 支援
- ❌ 不用安裝任何軟體、不用等套件下載

打開之後請先看 **[START-HERE.md](START-HERE.md)**，三個步驟就能跑出第一張圖。

> 講師請先開啟 Codespaces **預建置（prebuild）**，學生的開機時間會從 10 分鐘降到 30 秒。
> 設定方式見 [`.devcontainer/README.md`](.devcontainer/README.md)。

### 想長期保留自己的分析？

按 repo 首頁的 **Use this template → Create a new repository**，
你會得到一份完全屬於自己的副本（含資料、範本、環境設定），
可以放自己的研究資料、隨時開 Codespace 繼續做。

### 其他上課方式

| 方式 | 要裝什麼 | 適合 |
|------|---------|------|
| GitHub Codespaces（推薦） | 什麼都不用 | 課堂、臨時開機 |
| [Posit.cloud](https://posit.cloud/) | 什麼都不用（部分套件要自己裝） | 沒有 GitHub 帳號 |
| 本機 Positron / RStudio | R + Quarto + `source("install.r")` | 長期自用、資料不能上雲 |

## 在線閱讀

| 資源 | 連結 |
|------|------|
| 書籍網址 | [htlin222.github.io/learn-r-with-ai](https://htlin222.github.io/learn-r-with-ai/) |
| GitHub 倉庫 | [github.com/htlin222/learn-r-with-ai](https://github.com/htlin222/learn-r-with-ai) |
| 下載程式碼 | [點此下載 ZIP](https://github.com/htlin222/learn-r-with-ai/archive/refs/heads/main.zip) |

## 課程目標

今天結束時，你將能夠：

- 把問題描述清楚，讓 AI 幫你寫程式
- 看懂 AI 給的程式碼大概在做什麼
- 當程式出錯，知道怎麼問 AI 修正
- 產出可以放進論文的表格和圖表
- 有一個可以重複使用的分析範本

## 這堂課的玩法

1. 我給你一個「任務」
2. 你把任務描述貼給 AI（ChatGPT / Claude）
3. AI 給你程式碼
4. 你貼到 Codespaces / Positron / Posit.cloud 執行
5. 我們一起看結果、理解發生了什麼

**記住：你的工作是「問對問題」，不是「寫對程式」。**

## 項目結構

```
learn-r-with-ai/
├── .devcontainer/                       # Codespaces 環境（R、Quarto、套件、中文字型）
│   ├── devcontainer.json                #   環境定義
│   ├── setup.sh                         #   建立容器時自動裝好所有套件
│   └── README.md                        #   給講師：如何開啟預建置 prebuild
│
├── START-HERE.md                        # 學生入門：三步驟開始上課
├── my_analysis.R                        # 學生的分析範本（改最上面的設定就能換資料）
│
├── _quarto.yml                          # Quarto 書籍配置
├── _common.R                            # 全域 R 設定（字型、主題、knitr）
├── .Rprofile                            # 開啟專案時的 R 設定
├── install.r                            # 一鍵安裝所有套件
│
├── index.qmd                            # 前言
├── part1.qmd                            # 第一部分：快速入門（任務 1-5）
├── part2.qmd                            # 第二部分：讀取你的資料（任務 6-8）
├── part3.qmd                            # 第三部分：產出你的 Table 1（任務 9-14）
├── part4.qmd                            # 第四部分：畫出論文等級的圖（任務 15-19）
├── part5.qmd                            # 第五部分：統計檢定（任務 20-24）
├── part6.qmd                            # 第六部分：整合與收尾（任務 25-30）
├── appendix.qmd                         # 附錄：常見技術問題與解決方案
│
├── patient_data.csv                     # 主要教學資料（100 筆病人）
├── patient_data_for_survival.csv        # 存活分析資料（100 筆）
├── patient_data_meta.csv                # 統合分析資料（8 篇研究）
│
├── boxplot_los.R                        # 範例：盒狀圖腳本
├── multi_panel_plot.R                   # 範例：多面板組合圖
├── meta_analysis.R                      # 範例：統合分析
├── mission1.r                           # 範例：存活分析
│
├── references.bib                       # 參考文獻（BibTeX）
├── american-medical-association.csl      # AMA 引用格式
├── presentation-complete.Rmd            # 完整課程簡報
├── presentation-part1.Rmd              # 第一部分簡報示範
├── styles.css                           # 簡報樣式
├── README.md                            # 本文件
└── LICENSE                              # MIT 授權
```

## 構建說明

### 安裝依賴

用 Codespaces 的話這一段可以跳過 — 環境已經幫你裝好了。

在本機建置需要：

- [Quarto](https://quarto.org/docs/get-started/)
- [R](https://cran.r-project.org/)（建議 4.4 以上），並執行 `source("install.r")`
- IDE 選擇（任選一個）：
  - [Positron](https://positron.posit.co/download.html) - Posit 新一代 IDE
  - [Posit.cloud](https://posit.cloud/) - 雲端開發環境（免安裝）

### 構建書籍

```bash
quarto render
```

這將生成 HTML 和 PDF 版本的書籍在 `_book/` 目錄中。

### 預覽書籍

```bash
quarto preview
```

這將啟動一個本地服務器來預覽書籍。

### 使用簡報功能

本項目包含 R Markdown 簡報文件，可以在 Positron / Posit.cloud 的 Presentation 標籤中使用：

1. **開啟簡報檔案**：
   - `presentation-complete.Rmd` - 完整課程簡報
   - `presentation-part1.Rmd` - 第一部分示範簡報

2. **在 Positron / Posit.cloud 中使用**：
   - 開啟 `.Rmd` 檔案
   - 點擊 **Knit** 按鈕
   - 選擇 "Knit to HTML (ioslides)"
   - 簡報會在 Presentation 標籤中顯示

3. **簡報控制**：
   - 使用方向鍵切換投影片
   - 按 `f` 進入全螢幕模式
   - 按 `w` 切換到黑白模式
   - 按 `o` 顯示簡報概覽

## 資料說明

本課程使用 `patient_data.csv` 檔案，包含以下欄位：

| 欄位 | 說明 |
|------|------|
| `patient_id` | 病人編號 |
| `treatment` | 治療組別（A 或 B） |
| `age` | 年齡 |
| `gender` | 性別（M 或 F） |
| `los` | 住院天數（length of stay） |

## 聯繫信息

講師：林協霆
日期：2025/12/05

## License

This project is licensed under the [MIT License](LICENSE).
