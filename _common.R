# ============================================
# _common.R - 專案全域設定
# 每個 .qmd 檔案開頭自動載入
# ============================================

# 載入核心套件
suppressPackageStartupMessages({
  library(ggplot2)
  library(dplyr)
  library(showtext)
  library(sysfonts)
})

# 設定中文字型
# 1) 先試 Google Fonts 的 Noto Sans TC（需要網路）
# 2) 失敗就找系統內建的 Noto CJK 字型（Codespaces 已預裝 fonts-noto-cjk）
# 3) 都沒有就退回 ggplot2 預設字型（中文可能變方框，但程式不會中斷）
base_family <- "noto-sans-tc"

font_ok <- tryCatch(
  {
    font_add_google("Noto Sans TC", "noto-sans-tc")
    TRUE
  },
  error = function(e) FALSE
)

if (!font_ok) {
  ff <- font_files()
  hit <- which(grepl("NotoSansCJK|NotoSansTC|NotoSerifCJK", ff$file))
  if (length(hit) > 0) {
    font_add("noto-sans-tc", regular = file.path(ff$path[hit[1]], ff$file[hit[1]]))
  } else {
    base_family <- ""  # 用系統預設字型
    message("找不到中文字型，圖表中的中文可能顯示為方框。")
  }
}

showtext_auto()

# 設定 ggplot2 全域主題（含字型）
theme_set(

  theme_minimal(base_family = base_family) +
    theme(
      plot.title = element_text(face = "bold", hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5)
    )
)

# 設定 knitr 選項
# 如果 ragg 有安裝就用 ragg_png（品質較好），否則用預設 png
# （在一般 R 終端機執行時沒有 knitr 也不會出錯）
if (requireNamespace("knitr", quietly = TRUE)) {
  knitr::opts_chunk$set(
    fig.showtext = TRUE,
    fig.retina = 2,
    dev = if (requireNamespace("ragg", quietly = TRUE)) "ragg_png" else "png"
  )
}
