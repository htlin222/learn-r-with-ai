# 開發環境說明（給講師 / 助教）

這個資料夾讓整堂課可以在 **GitHub Codespaces** 裡進行：學生不用安裝 R、
不用安裝套件、不用處理中文字型，打開瀏覽器就能上課。

## 裡面有什麼

| 檔案 | 用途 |
|------|------|
| `devcontainer.json` | 環境定義：R 映像、Quarto、系統字型、VS Code 擴充套件 |
| `setup.sh` | 建立容器時執行一次，安裝 `install.r` 裡的所有課程套件 |
| `welcome.txt` | 學生每次連上 Codespace 時顯示的歡迎訊息 |

環境內容：

- R 4.5 + tidyverse（基底映像 `ghcr.io/rocker-org/devcontainer/tidyverse`，
  預設走 Posit Public Package Manager 的二進位套件，安裝速度是原始碼編譯的數十倍）
- Quarto + TinyTeX（可輸出 HTML / PDF / Word）
- 課程套件：gtsummary、ggplot2、survival、flextable⋯⋯（清單見專案根目錄 `install.r`）
- 中文字型 `fonts-noto-cjk`，圖表中文不會變成豆腐方塊
- VS Code 擴充套件：R、R Debugger、Quarto、繁體中文語言包

## 開啟預建置（prebuild）— 重要

沒有預建置的話，第一次開 Codespace 要等 8～12 分鐘裝套件；
開啟預建置後，學生開機時間會降到 **30 秒左右**。

1. 到 repo 的 **Settings → Codespaces → Set up prebuild**
2. Branch 選 `main`，Configuration file 選 `.devcontainer/devcontainer.json`
3. Prebuild triggers 建議勾選 **On configuration change** 與 **On a schedule（每週一次）**
4. Region 選學生所在地區（台灣選 `Southeast Asia`）
5. 按 **Create**

第一次預建置會跑 10 分鐘左右，完成後 repo 首頁的 Codespace 選單會出現
⚡ 閃電標記，代表這台機器是從預建置映像開的。

改了 `install.r` 或 `.devcontainer/` 內任何檔案並 push 之後，
預建置會自動重跑，記得在上課前確認閃電標記還在。

## 把 repo 設成範本（template）

讓學生可以按 **Use this template** 開出自己的副本：

**Settings → General → 勾選 Template repository**

勾了之後 repo 首頁會多一顆綠色的 **Use this template** 按鈕。

## 兩種上課方式

| 方式 | 學生怎麼開 | 預建置有效嗎 | 適合 |
|------|-----------|-------------|------|
| **直接開講師的 repo** | 按 README 上的 Open in GitHub Codespaces | ✅ 有（約 30 秒） | 課堂當下，人多、時間緊 |
| **Use this template 開自己的 repo** | 先建立自己的 repo，再開 Codespace | ❌ 沒有（首次約 10 分鐘） | 課後長期使用、想保留自己的分析 |

**預建置只對設定它的 repo 有效**，用 template 或 fork 產生的新 repo 不會繼承。
建議課堂上走第一種，下課後再請學生用 template 開自己的 repo 練習。

## 本機驗證

```bash
npm install -g @devcontainers/cli
devcontainer build --workspace-folder .
```

## 免費額度提醒

個人帳號每月有 120 核心小時的免費額度（2 核心機器 = 60 小時）。
本設定固定使用最小的 2 核心規格，一堂 3 小時的課大約消耗 6 核心小時。
提醒學生下課後到 <https://github.com/codespaces> 把 Codespace 停掉或刪除。
