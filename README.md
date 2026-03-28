# R 語言統計工具入門：用 AI 學會做臨床研究統計

[![GitHub stars](https://img.shields.io/github/stars/htlin222/learn-r-with-ai?style=social)](https://github.com/htlin222/learn-r-with-ai/stargazers)
[![Last Commit](https://img.shields.io/github/last-commit/htlin222/learn-r-with-ai)](https://github.com/htlin222/learn-r-with-ai/commits/main)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

> 一個以 Quarto 建置的開源教學書籍，教你如何善用 AI 輔助學習 R 語言，完成臨床研究統計分析 -- 從零開始，不需要程式背景。

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
4. 你貼到 RStudio / Antigravity 執行
5. 我們一起看結果、理解發生了什麼

**記住：你的工作是「問對問題」，不是「寫對程式」。**

## 項目結構

```
learn-r-with-ai/
├── index.qmd                   # 封面頁
├── part1.qmd                   # 第一部分：你今天就會寫程式
├── part2.qmd                   # 第二部分：讀取你的資料
├── part3.qmd                   # 第三部分：產出你的 Table 1
├── part4.qmd                   # 第四部分：畫出論文等級的圖
├── part5.qmd                   # 第五部分：統計檢定
├── part6.qmd                   # 第六部分：整合與收尾
├── appendix.qmd                # 附錄：給講師的備註
├── patient_data.csv            # 示例數據
├── _quarto.yml                 # Quarto 配置文件
├── presentation-complete.Rmd   # 完整課程簡報
├── presentation-part1.Rmd      # 第一部分簡報示範
└── styles.css                  # 簡報樣式文件
```

## 構建說明

### 安裝依賴

確保您已安裝：

- [Quarto](https://quarto.org/docs/get-started/)
- [R](https://cran.r-project.org/)
- IDE 選擇（任選一個）：
  - [RStudio](https://posit.co/download/rstudio-desktop/) - 傳統 R 開發環境
  - [Antigravity](https://antigravity.dev/) - 現代 AI 輔助開發環境

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

本項目包含 R Markdown 簡報文件，可以在 RStudio / Antigravity 的 Presentation 標籤中使用：

1. **開啟簡報檔案**：
   - `presentation-complete.Rmd` - 完整課程簡報
   - `presentation-part1.Rmd` - 第一部分示範簡報

2. **在 RStudio / Antigravity 中使用**：
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
