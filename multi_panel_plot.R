# 載入套件
library(ggplot2)
library(ggsci)
library(showtext)
library(svglite)
library(ggh4x)
library(patchwork)

# 載入中文字體 - 使用 Google Fonts
font_add_google("Noto Sans TC", "noto-sans-tc")
showtext_auto()

# 讀取資料
my_data <- read.csv("patient_data.csv")

# A — 長條圖：性別人數分佈
p_bar <- ggplot(my_data, aes(x = gender, fill = gender)) +
  geom_bar(width = 0.6, alpha = 0.8) +
  geom_text(stat = "count", aes(label = after_stat(count)), vjust = -0.5) +
  scale_fill_jama() +
  scale_x_discrete(labels = c("F" = "女性", "M" = "男性")) +
  labs(title = "性別人數分佈", x = "性別", y = "人數") +
  theme_classic(base_family = "noto-sans-tc") +
  theme(legend.position = "none")

# B — 散佈圖：年齡 vs 住院天數（依治療組別分色）
p_scatter <- ggplot(my_data, aes(x = age, y = los, color = treatment)) +
  geom_point(size = 2.5, alpha = 0.7) +
  geom_smooth(method = "lm", se = TRUE, alpha = 0.2) +
  scale_color_jama() +
  labs(
    title = "年齡與住院天數關係",
    x = "年齡（歲）",
    y = "住院天數（天）",
    color = "治療組"
  ) +
  theme_classic(base_family = "noto-sans-tc") +
  theme(legend.position = "bottom")

# C — 直方圖：住院天數分佈（依治療組別分面）
p_hist <- ggplot(my_data, aes(x = los, fill = treatment)) +
  geom_histogram(binwidth = 2, alpha = 0.8, color = "white") +
  scale_fill_jama() +
  # 使用 ggh4x 的 facet_wrap2 獨立縮放
  facet_wrap2(
    ~treatment,
    scales = "free_y",
    axes = "all",
    labeller = labeller(treatment = c("A" = "治療 A", "B" = "治療 B"))
  ) +
  labs(title = "住院天數分佈", x = "住院天數（天）", y = "人數") +
  theme_classic(base_family = "noto-sans-tc") +
  theme(legend.position = "none")

# D — 盒狀圖：使用 ggh4x 巢狀分面
p_box <- ggplot(my_data, aes(
  x = treatment, y = los, fill = treatment
)) +
  geom_violin(alpha = 0.3, width = 0.8, trim = FALSE) +
  geom_boxplot(width = 0.3, alpha = 0.8, outlier.shape = NA) +
  stat_summary(
    fun = mean, geom = "point",
    shape = 18, size = 3, color = "black"
  ) +
  scale_fill_jama() +
  # 使用 ggh4x 的 facet_nested 巢狀分面
  facet_nested(
    ~ gender,
    nest_line = element_line(linewidth = 0.5),
    labeller = labeller(gender = c("F" = "女性", "M" = "男性"))
  ) +
  labs(
    title = "住院天數比較",
    subtitle = "◆ 表示平均值",
    x = "治療組別",
    y = "住院天數（天）"
  ) +
  theme_classic(base_family = "noto-sans-tc") +
  theme(legend.position = "none")

# 使用 patchwork 組合四張圖
combined <- (p_bar | p_scatter) / (p_hist | p_box) +
  plot_annotation(
    title = "病患資料綜合分析",
    theme = theme(
      plot.title = element_text(
        size = 18, face = "bold", hjust = 0.5, family = "noto-sans-tc"
      )
    )
  )

# 顯示圖表
print(combined)

# 儲存圖表
ggsave(
  "multi_panel_plot.png", combined,
  width = 14, height = 10, dpi = 300
)
ggsave(
  "multi_panel_plot.svg", combined,
  width = 14, height = 10, device = svglite
)
