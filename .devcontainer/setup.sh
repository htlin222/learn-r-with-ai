#!/usr/bin/env bash
# ============================================
# setup.sh — Codespace 建立時執行一次（預建置階段也會跑）
# 目的：把上課要用的 R 套件全部裝好，學生打開就能直接開始。
# ============================================
set -euo pipefail

# 基底映像是用 root 裝套件的，套件庫（含 pak 的 _cache 目錄）屬於 root，
# 但這個腳本是以一般使用者身分執行 -> pak 會卡在 "Cannot open lock file"。
# 先把套件庫的擁有者改成目前使用者，順便讓學生上課臨時想裝套件時也不需要 sudo。
echo "==> 調整 R 套件庫權限"
R_LIB="$(Rscript -e 'cat(.libPaths()[1])')"
if [ "$(id -u)" -ne 0 ] && command -v sudo >/dev/null 2>&1; then
  sudo -n chown -R "$(id -u):$(id -g)" "$R_LIB" ||
    echo "    （警告：改不了擁有者，若接下來安裝失敗請檢查套件庫權限）"
fi
echo "    套件庫：$R_LIB"

echo "==> 安裝課程 R 套件（install.r）"
Rscript install.r

echo "==> 安裝 VS Code / Quarto 的輔助套件"
Rscript -e 'pak::pak(c(
  "languageserver",   # VS Code 的 R 自動補全與提示
  "httpgd",           # 在 VS Code 面板中顯示 ggplot 圖形
  "knitr",            # 渲染 .qmd
  "rmarkdown"         # 渲染 .Rmd 簡報
), ask = FALSE, upgrade = FALSE)'

echo "==> 檢查課程套件是否都可以載入"
Rscript -e '
pkgs <- c("ggplot2", "dplyr", "gtsummary", "skimr", "ggsci", "patchwork",
          "showtext", "sysfonts", "broom", "effsize", "car",
          "survival", "ggsurvfit", "flextable", "officer")
missing <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) {
  cat("注意：以下套件尚未安裝成功 ->", paste(missing, collapse = ", "), "\n")
  cat("開課前請在 R 終端機執行 source(\"install.r\") 重試。\n")
} else {
  cat("全部課程套件都就緒了。\n")
}'

echo "==> 環境準備完成"
