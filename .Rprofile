# ============================================
# .Rprofile — 開啟這個專案時自動執行
# 只做兩件事：設定套件下載來源、印出提示。不會影響你的分析結果。
# ============================================

local({
  # 沒設定 CRAN 來源時，指定一個，避免安裝套件時跳出「選擇鏡像」視窗
  r <- getOption("repos")
  if (is.null(r[["CRAN"]]) || r[["CRAN"]] == "@CRAN@") {
    r["CRAN"] <- "https://cloud.r-project.org/"
    options(repos = r)
  }

  if (interactive()) {
    message("R 語言統計工具入門 — 需要幫忙就打開 START-HERE.md")
    message("你的工作檔案：my_analysis.R｜課程資料：patient_data.csv")
  }
})
