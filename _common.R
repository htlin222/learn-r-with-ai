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

# 設定中文字型 - 使用 Google Fonts 的 Noto Sans TC
font_add_google("Noto Sans TC", "noto-sans-tc")
showtext_auto()

# 設定 ggplot2 全域主題（含字型）
theme_set(

  theme_minimal(base_family = "noto-sans-tc") +
    theme(
      plot.title = element_text(face = "bold", hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5)
    )
)

# 設定 knitr 選項
# 如果 ragg 有安裝就用 ragg_png（品質較好），否則用預設 png
knitr::opts_chunk$set(
  fig.showtext = TRUE,
  fig.retina = 2,
  dev = if (requireNamespace("ragg", quietly = TRUE)) "ragg_png" else "png"
)
