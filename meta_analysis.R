# ============================================================
# Meta-Analysis: Treatment vs Control Group Comparison
# ============================================================

# 載入必要套件
if (!require("meta")) install.packages("meta")
if (!require("metafor")) install.packages("metafor")
if (!require("dplyr")) install.packages("dplyr")
if (!require("ggplot2")) install.packages("ggplot2")

library(meta)
library(metafor)
library(dplyr)
library(ggplot2)

# ============================================================
# 1. 讀取資料
# ============================================================

data <- read.csv("patient_data_meta.csv")
print("原始資料：")
print(data)

# ============================================================
# 2. 執行 Meta-Analysis (Random Effects Model)
# ============================================================

# 使用 meta 套件進行連續變項的統合分析
# 計算 Mean Difference (MD)
meta_result <- metacont(
  n.e = n_treatment,           # 治療組樣本數
  mean.e = mean_treatment,     # 治療組平均值
  sd.e = sd_treatment,         # 治療組標準差
  n.c = n_control,             # 對照組樣本數
  mean.c = mean_control,       # 對照組平均值
  sd.c = sd_control,           # 對照組標準差
  studlab = study,             # 研究名稱
  data = data,
  sm = "MD",                   # Summary Measure: Mean Difference
  method.tau = "REML",         # 估計 tau² 的方法
  hakn = TRUE,                 # Hartung-Knapp adjustment
  title = "Treatment vs Control: Meta-Analysis"
)

# ============================================================
# 3. 顯示結果摘要
# ============================================================

cat("\n============================================================\n")
cat("           Meta-Analysis 結果摘要\n")
cat("============================================================\n\n")

print(summary(meta_result))

# ============================================================
# 4. 異質性檢定
# ============================================================

cat("\n============================================================\n")
cat("           異質性分析 (Heterogeneity)\n")
cat("============================================================\n")
cat(sprintf("Q statistic: %.2f (df = %d, p = %.4f)\n",
            meta_result$Q, meta_result$df.Q, meta_result$pval.Q))
cat(sprintf("I² (inconsistency): %.1f%%\n", meta_result$I2 * 100))
cat(sprintf("τ² (between-study variance): %.4f\n", meta_result$tau2))
cat(sprintf("τ (standard deviation): %.4f\n", meta_result$tau))

cat("\nI² 解讀標準：\n")
cat("  0-25%: 低異質性\n")
cat("  25-50%: 中等異質性\n")
cat("  50-75%: 較高異質性\n")
cat("  >75%: 高異質性\n")

# ============================================================
# 5. Forest Plot
# ============================================================

cat("\n正在產生 Forest Plot...\n")

# 儲存 Forest Plot
png("forest_plot.png", width = 10, height = 8, units = "in", res = 300)
forest(meta_result,
       sortvar = TE,
       prediction = TRUE,           # 顯示預測區間
       print.tau2 = TRUE,
       print.I2 = TRUE,
       print.pval.Q = TRUE,
       leftcols = c("studlab", "n.e", "n.c"),
       leftlabs = c("Study", "N (Tx)", "N (Ctrl)"),
       rightcols = c("effect", "ci"),
       rightlabs = c("MD", "95% CI"),
       col.diamond = "blue",
       col.predict = "darkred",
       smlab = "Mean Difference",
       xlim = c(-20, 5))
dev.off()
cat("Forest Plot 已儲存為 forest_plot.png\n")

# ============================================================
# 6. Funnel Plot (發表偏誤檢測)
# ============================================================

cat("\n正在產生 Funnel Plot...\n")

png("funnel_plot.png", width = 8, height = 6, units = "in", res = 300)
funnel(meta_result,
       xlab = "Mean Difference",
       studlab = TRUE,
       col = "blue",
       bg = "lightblue")
dev.off()
cat("Funnel Plot 已儲存為 funnel_plot.png\n")

# ============================================================
# 7. 發表偏誤檢定 (Egger's Test)
# ============================================================

cat("\n============================================================\n")
cat("           發表偏誤檢定 (Egger's Test)\n")
cat("============================================================\n")

egger_test <- tryCatch({
  metabias(meta_result, method.bias = "Egger", k.min = 5)
}, error = function(e) {
  cat("無法執行 Egger's test:", e$message, "\n")
  NULL
})

if (!is.null(egger_test)) {
  print(egger_test)
  if (!is.null(egger_test$p.value) && length(egger_test$p.value) > 0) {
    if (egger_test$p.value < 0.05) {
      cat("\n結論：Egger's test 顯著 (p < 0.05)，可能存在發表偏誤\n")
    } else {
      cat("\n結論：Egger's test 不顯著 (p >= 0.05)，未發現明顯發表偏誤\n")
    }
  }
} else {
  cat("注意：研究數量較少 (k=8)，Egger's test 結果需謹慎解讀\n")
}

# ============================================================
# 8. 敏感度分析 (Leave-one-out)
# ============================================================

cat("\n============================================================\n")
cat("           敏感度分析 (Leave-One-Out)\n")
cat("============================================================\n")

influence_result <- metainf(meta_result, pooled = "random")
print(influence_result)

# 儲存敏感度分析圖
png("sensitivity_plot.png", width = 10, height = 8, units = "in", res = 300)
forest(influence_result,
       col.diamond = "red",
       leftcols = c("studlab"),
       leftlabs = c("Omitting Study"),
       smlab = "Mean Difference (95% CI)")
dev.off()
cat("\n敏感度分析圖已儲存為 sensitivity_plot.png\n")

# ============================================================
# 9. 最終結論
# ============================================================

cat("\n============================================================\n")
cat("           最終結論\n")
cat("============================================================\n")

# 取得隨機效應模型的結果
pooled_md <- meta_result$TE.random
pooled_ci_lower <- meta_result$lower.random
pooled_ci_upper <- meta_result$upper.random
pooled_p <- meta_result$pval.random

cat(sprintf("\n統合平均差異 (Pooled MD): %.2f\n", pooled_md))
cat(sprintf("95%% 信賴區間: [%.2f, %.2f]\n", pooled_ci_lower, pooled_ci_upper))
cat(sprintf("p-value: %.6f\n", pooled_p))

cat(sprintf("\n納入研究數: %d\n", meta_result$k))
cat(sprintf("總樣本數 (治療組): %d\n", sum(data$n_treatment)))
cat(sprintf("總樣本數 (對照組): %d\n", sum(data$n_control)))

if (pooled_p < 0.05) {
  cat("\n統計結論：治療組與對照組之間存在統計顯著差異 (p < 0.05)\n")
} else {
  cat("\n統計結論：治療組與對照組之間無統計顯著差異 (p >= 0.05)\n")
}

cat(sprintf("\n臨床解讀：治療組的平均值比對照組低 %.1f 單位\n", abs(pooled_md)))
cat("（負值表示治療組的結果數值較低）\n")

cat("\n============================================================\n")
cat("           分析完成！\n")
cat("============================================================\n")
cat("\n產出檔案：\n")
cat("  1. forest_plot.png - 森林圖\n")
cat("  2. funnel_plot.png - 漏斗圖\n")
cat("  3. sensitivity_plot.png - 敏感度分析圖\n")
