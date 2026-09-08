# =============================================================
#  my_analysis.R — 你的臨床研究分析範本
# =============================================================
#
#  怎麼用：
#    1. 只改「設定區」（下面第一段），其他都不用動
#    2. 把游標放在程式碼上，按 Ctrl + Enter（Mac: Cmd + Enter）逐行執行
#    3. 或在終端機執行：Rscript my_analysis.R
#
#  想加功能？把這個檔案整個貼給 AI，告訴它你想多做什麼。
#  例如：「請幫我在這個範本加上 Kaplan-Meier 存活曲線。」
# =============================================================


# ── 設定區：以後換資料，只要改這裡 ──────────────────────────

DATA_FILE   <- "patient_data.csv"   # 你的資料檔（換成自己的 CSV）
GROUP_VAR   <- "treatment"          # 分組變數（Table 1 要比較的組別）
OUTCOME_VAR <- "los"                # 主要結果變數（畫圖、做檢定用，需為數值）

# Table 1 要放進去的變數（順序就是表格的順序）
VARS <- c("age", "gender", "los")

# 中文標籤：左邊是欄位名稱，右邊是表格上要顯示的文字
LABELS <- list(
  treatment = "治療組別",
  age       = "年齡（歲）",
  gender    = "性別",
  los       = "住院天數（天）"
)

# 輸出檔名
OUT_TABLE <- "Table1.docx"          # Table 1（Word）
OUT_PLOT  <- "boxplot.png"          # 盒狀圖（PNG, 300 dpi）
OUT_TEXT  <- "my_report.txt"        # 統計檢定的純文字報告

# ── 設定區結束，以下通常不用改 ──────────────────────────────


# 1. 載入套件 ------------------------------------------------
library(dplyr)
library(ggplot2)
library(gtsummary)
library(flextable)

# 中文字型與繪圖主題（_common.R 已幫你設定好）
if (file.exists("_common.R")) {
  ok <- tryCatch({ source("_common.R"); TRUE }, error = function(e) FALSE)
  if (!ok) message("提示：_common.R 載入失敗，圖表中的中文可能顯示為方框。")
}

# 小工具：查中文標籤，沒設定就直接用欄位名稱
label_of <- function(v) if (!is.null(LABELS[[v]])) LABELS[[v]] else v


# 2. 讀取資料 ------------------------------------------------
my_data <- read.csv(DATA_FILE, stringsAsFactors = FALSE)

cat("讀到", nrow(my_data), "筆資料、", ncol(my_data), "個欄位\n")
print(head(my_data))

# 檢查設定的欄位是否真的存在（打錯字時會在這裡提醒你）
missing_cols <- setdiff(c(GROUP_VAR, OUTCOME_VAR, VARS), names(my_data))
if (length(missing_cols) > 0) {
  stop("資料裡找不到這些欄位：", paste(missing_cols, collapse = ", "),
       "\n請檢查設定區的欄位名稱是否拼對了。")
}


# 3. Table 1（含 p-value）------------------------------------
# 只保留有出現在 VARS 裡的標籤（分組變數的標籤 gtsummary 不需要）
table_labels <- LABELS[intersect(names(LABELS), VARS)]
if (length(table_labels) == 0) table_labels <- NULL

my_table <- my_data |>
  select(all_of(unique(c(GROUP_VAR, VARS)))) |>
  tbl_summary(
    by = all_of(GROUP_VAR),
    label = table_labels,
    statistic = list(
      all_continuous()  ~ "{mean} ± {sd}",     # 連續變數：平均 ± 標準差
      all_categorical() ~ "{n} ({p}%)"          # 類別變數：人數（百分比）
    ),
    digits = all_continuous() ~ 1
  ) |>
  add_p() |>            # 加上 p-value（gtsummary 會自動選檢定方法）
  bold_p(t = 0.05) |>   # p < 0.05 用粗體標示
  add_overall() |>      # 加一欄「全體」
  modify_header(label ~ "**變項**")

print(my_table)


# 4. 盒狀圖 --------------------------------------------------
my_plot <- ggplot(
  my_data,
  aes(x = .data[[GROUP_VAR]], y = .data[[OUTCOME_VAR]], fill = .data[[GROUP_VAR]])
) +
  geom_boxplot(alpha = 0.7, outlier.shape = NA) +
  geom_jitter(width = 0.15, alpha = 0.5, size = 1.8) +   # 疊上個別資料點
  labs(
    title = paste0(label_of(OUTCOME_VAR), "：分組比較"),
    x = label_of(GROUP_VAR),
    y = label_of(OUTCOME_VAR)
  ) +
  theme(legend.position = "none")

print(my_plot)


# 5. 統計檢定 ------------------------------------------------
# 用設定區的變數自動組出公式，例如 los ~ treatment
my_formula <- reformulate(GROUP_VAR, response = OUTCOME_VAR)

t_result <- t.test(my_formula, data = my_data)        # 常態分佈時用
w_result <- wilcox.test(my_formula, data = my_data)   # 不確定常態時用（較保險）

print(t_result)
print(w_result)


# 6. 存檔 ----------------------------------------------------
my_table |>
  as_flex_table() |>
  save_as_docx(path = OUT_TABLE)

ggsave(OUT_PLOT, my_plot, width = 8, height = 6, dpi = 300, units = "in")

sink(OUT_TEXT)
cat("分析日期：", format(Sys.Date()), "\n")
cat("資料檔：", DATA_FILE, "（", nrow(my_data), "筆）\n\n")
print(t_result)
print(w_result)
sink()

cat("\n完成！產出了三個檔案：\n")
cat("  -", OUT_TABLE, "（Table 1，可直接貼進論文）\n")
cat("  -", OUT_PLOT, "（300 dpi 圖檔）\n")
cat("  -", OUT_TEXT, "（統計檢定報告）\n")
cat("在左邊檔案列表對檔案按右鍵 → Download，就能下載到自己的電腦。\n")
