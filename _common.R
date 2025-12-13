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
font_add("jf-openhuninn", "jf-openhuninn-2.1.ttf")
showtext_auto()

# 設定 ggplot2 全域主題（含字型）
theme_set(

  theme_minimal(base_family = "jf-openhuninn") +
    theme(
      plot.title = element_text(face = "bold", hjust = 0.5),
      plot.subtitle = element_text(hjust = 0.5)
    )
)

# 設定 knitr 選項
knitr::opts_chunk$set(
  fig.showtext = TRUE,
  fig.retina = 2,
  dev = "ragg_png"
)
