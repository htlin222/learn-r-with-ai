# ============================================
# install.r - 一鍵安裝本課程所需的所有 R 套件
# 使用方式：在 R 終端機執行 source("install.r")
#
# 提示：如果在課堂上網路太慢，請在上課前一天跑完。
# Posit.cloud 使用者大多數套件已預裝，可跳過此步驟。
# ============================================

# 先安裝 pak（更快的套件管理器，支援平行下載）
if (!require("pak", quietly = TRUE)) {
  install.packages("pak", repos = "https://cloud.r-project.org/")
}

cat("開始安裝課程套件...\n")
cat("預計需要 5-8 分鐘，請耐心等候。\n\n")

pak::pak(c(
  # === 核心（Part 1-4）===
  "ggplot2",       # 畫圖（不裝 tidyverse 避免拉太多套件）
  "dplyr",         # 資料處理
  "gtsummary",     # Table 1
  "skimr",         # 資料摘要
  "ggsci",         # 期刊配色（JAMA 等）
  "patchwork",     # 多圖組合

  # === 中文字型 ===
  "showtext",      # 中文字型渲染
  "sysfonts",      # 字型管理

  # === 統計檢定（Part 5）===
  "broom",         # 整理統計結果
  "effsize",       # 效應量（Cohen's d）
  "car",           # Levene's test（安裝較慢，會拉 lme4）
  "survival",      # 存活分析
  "ggsurvfit",     # 存活曲線

  # === 匯出（Part 6）===
  "flextable",     # 表格格式化
  "officer",       # Word / PPT 匯出
  "report",        # 文字報告
  "svglite",       # SVG 向量圖

  # === 環境管理 ===
  "renv",          # 套件版本管理
  "sessioninfo"    # 環境資訊記錄
))

# ragg 需要系統函式庫，單獨裝，失敗也不影響課程
tryCatch(
  pak::pak("ragg"),
  error = function(e) {
    cat("\n注意：ragg 安裝失敗（可能缺少系統函式庫），不影響課程進行。\n")
    cat("圖片將使用預設 PNG 裝置。\n")
  }
)

cat("\n所有套件安裝完成！\n")
cat("你可以開始使用本課程的教材了。\n")
