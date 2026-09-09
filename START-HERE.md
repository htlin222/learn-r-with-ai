# 從這裡開始 👋

歡迎！這份文件只有三個步驟，做完你就可以開始上課了。

---

## 第 1 步：確認環境已經好了

如果你正在 **GitHub Codespaces** 裡看這份文件，恭喜 —
**R、套件、中文字型全部都裝好了，你什麼都不用安裝。**

在下方終端機（Terminal）輸入這行，按 Enter：

```bash
R
```

看到 `>` 提示符號，就代表 R 已經啟動。接著貼上這行測試：

```r
library(gtsummary); cat("環境沒問題，可以上課了！\n")
```

沒有紅色錯誤訊息就代表一切正常。（要離開 R 輸入 `q()`，再按 `n`。）

> **還沒有 Codespace？**
> 回到 [repo 首頁](https://github.com/htlin222/learn-r-with-ai)，
> 按綠色的 **Code** → **Codespaces** → **Create codespace on main**。

---

## 第 2 步：認識你的檔案

打開左側檔案列表，你會看到：

| 檔案 | 這是什麼 |
|------|---------|
| `my_analysis.R` | **你的工作檔案** — 上課時就改這一個 |
| `patient_data.csv` | 課程資料：100 位病人的年齡、性別、治療組別、住院天數 |
| `part1.qmd` ～ `part6.qmd` | 課程講義原始檔（線上版比較好讀） |
| `install.r` | 套件清單（Codespaces 已經幫你跑過了） |

線上講義：<https://htlin222.github.io/learn-r-with-ai/>

---

## 第 3 步：跑你的第一段程式

1. 點開 `my_analysis.R`
2. 把游標放在第一行程式碼上
3. 按 **Ctrl + Enter**（Mac 是 **Cmd + Enter**）
4. 程式碼會送到終端機執行，結果出現在下方

就是這樣。整堂課你都在重複這個動作。

---

## 這堂課的玩法

1. 講師給你一個「任務」
2. 你把任務描述**貼給 AI**（ChatGPT / Claude / Gemini）
3. AI 給你程式碼
4. 你貼到 `my_analysis.R` 執行
5. 一起看結果、理解發生了什麼

**你的工作是「問對問題」，不是「寫對程式」。**

---

## 出錯了怎麼辦？

**把整段紅色錯誤訊息複製起來**，貼給 AI，加上這句話：

> 我在 R 執行程式碼時出現這個錯誤：【貼上錯誤訊息】
> 請告訴我這是什麼意思，以及怎麼修正。

錯誤訊息是線索，不是你的錯。

---

## 下課之後

Codespace 停掉之後你的檔案還在，但**免費額度會慢慢用完**，
所以請到 <https://github.com/codespaces> 把用不到的 Codespace 停止或刪除。

想長期保留自己的分析？回到 repo 首頁按 **Use this template** →
**Create a new repository**，你就有一份完全屬於自己的副本了。
