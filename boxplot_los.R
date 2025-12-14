# 載入套件
library(ggplot2)
library(ggsci)
library(showtext)
library(svglite)
library(ggh4x)

# 載入自訂中文字體
font_add("openhuninn", "jf-openhuninn-2.1.ttf")
showtext_auto()

# 讀取資料
my_data <- read.csv("patient_data.csv")

# 繪製多元化盒狀圖（含小提琴圖、資料點、統計摘要）
p <- ggplot(my_data, aes(
  x = treatment, y = los, fill = treatment, color = treatment
)) +
  # 小提琴圖顯示分佈
  geom_violin(alpha = 0.3, width = 0.8, trim = FALSE) +
  # 盒狀圖
  geom_boxplot(width = 0.3, alpha = 0.8, outlier.shape = NA) +
  # 個別資料點
  geom_point(
    position = position_jitterdodge(jitter.width = 0.15, dodge.width = 0.3),
    size = 1.5,
    alpha = 0.6
  ) +
  # 平均值標記
  stat_summary(
    fun = mean,
    geom = "point",
    shape = 18,
    size = 4,
    color = "black"
  ) +
  # JAMA 配色
  scale_fill_jama() +
  scale_color_jama() +
  # 依性別分面
  facet_wrap(
    ~gender,
    labeller = labeller(gender = c("F" = "女性", "M" = "男性"))
  ) +
  labs(
    title = "兩組治療的住院天數比較",
    subtitle = "依性別分層 | ◆ 表示平均值",
    x = "治療組別",
    y = "住院天數（天）"
  ) +
  theme_classic(base_family = "openhuninn") +
  theme(
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5, size = 11, color = "gray40"),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    strip.text = element_text(size = 12, face = "bold"),
    strip.background = element_rect(fill = "gray95", color = NA),
    legend.position = "none"
  )

# 顯示圖表
print(p)

# 儲存圖表
ggsave("boxplot_los.png", p, width = 10, height = 6, dpi = 300)
ggsave("boxplot_los.svg", p, width = 10, height = 6, device = svglite)
