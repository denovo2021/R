library(ggplot2)

#データの読み込み
data <- read.csv("~/R/rstan/")

#x, y軸の指定
p_xy <- ggplot(data, aes(data$X, data$Y)) #x軸の指定
p_xy <- p_xy + theme(text = element_text(size = 20))+
        geom_point(alpha = 0.8, size = 2, shape = 1)+
        scale_x_continuous(limits = c( ,))+ #x軸の範囲
        scale_y_continuous(limits = c( , )) #y軸の範囲

p_x <- ggplot(data, aes(data$X)) + 
      theme(axis.text.x = element_blank(), axis.text.y = element_blank(), axis.ticks = element_blank()) +
      geom_histogram(aes(y = ..density..), colour = "black", fill = "white", binwidth = ) + #bin幅の指定
      geom_density(alpha = 0.3, fill = "gray20") + 
      scale_x_continuous(limits = c( ,)) + #x軸の範囲（上と同じ）
      labs(x = "", y = "")

p_y <- ggplot(data, aes(data$Y)) + #y軸の指定
  theme(axis.text.x = element_blank(), axis.text.y = element_blank(), axis.ticks = element_blank()) +
  coord_flip() +
  geom_histogram(aes(y = ..density..), colour = "black", fill = "white", binwidth = ) + #bin幅の指定
  geom_density(alpha = 0.3, fill = "gray20") + 
  scale_x_continuous(limits = c( ,)) + #y軸の範囲（上と同じ）
  labs(x = "", y = "")

p_emp <- ggplot(data.frame(0, 0))+ theme_bw() + 
        theme(rect = element_rect(fill = "white"), panel.border = element_blank())

g_xy <- ggplotGrob(p_xy)
g_x <- ggplotGrob(p_x)
g_y <- ggplotGrob(p_y)
g_emp <- ggplotGrob(p_emp)

g1 <- cbind(g_x, g_emp, size = "first")
g2 <- cbind(g_xy, g_y, size = "first")
g <- rbind(g1, g2, size = "first")

g$widths[1:3] <- grid::unit.pmax(g1$widths[1:3], g2$widths[1:3])
#上段g1の左3列と下段(g2)の左3列の単位の大きい方を取ることで、ylabとaxis-lの文字がかぶるのを防ぐ
g$heights[7:12] <- g$widths[5:10] <- rep(unit(0.3, "mm"), 6)
#左上panelと左下titleの間のスペース(g$heights[7:12])と左下panelと右下panelの間のスペース(g$widths[5:10])を0.3mm*6で揃える
g$heights[6] <- g$widths[11] <- unit(3, "cm")
#左上panelの縦幅と右下panelの横幅を3cmで揃える

#ファイル名の指定
png(file="~/R/fig1.png", res=300, w=1500, h=1500)
grid::grid.draw(g)
dev.off()