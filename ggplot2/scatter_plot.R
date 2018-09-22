#scatter plot

library(ggplot2)
library(tidyverse)

#グラフタイトル14p
#日本語表示
ggplot()+theme_set(theme_bw(base_size = 14, base_family = "HiraKakuProN-W3"))

#データを設定
data <- read.csv("~/R/rstan/")

#基本データの読み込み
g1 <- ggplot(data, #データの宣言
            aes(x = data$, #x軸に使う項目
                 y = data$)) #y軸に使う項目

g1 <- g1 + geom_point(aes(colour = ), #色分けの項目
                      size = 1, #点の大きさ
                      alpha = 1, #透過性
                      shape = 1) #プロットの形状
                      
#軸タイトル
g1 <- g1 + xlab("") + ylab("")                    

#回帰直線
g1 <- g1 + geom_smooth(method =  "lm",
                       colour = "black",#線の色
                       size = 0.5, #線の太さ
                       alpha = 1,#透過性 
                       se = TRUE,#信頼区間を表示するかどうか
                       level = 0.95, #信頼区間の幅
                       fill = "gray")#信頼区間の色

g1