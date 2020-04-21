# Size = 4 x 7 
# z-values

x <- seq(-4, 4, 0.01)
y <- dnorm(x)
plot(1, 1, type = "n", las = 1, xlab = "", ylab = "", bty = "n", yaxt = "n", xaxt = "n", 
     ylim = c(0, 0.4), xlim = c(-4, 4))
axis(1, at = c(-4, 0, 1, 4), labels = c("", "0", "z", ""), lwd.ticks = 0, cex.axis = 1.5)
axis(2, at = c(0, 0.4), labels = NA, lwd.ticks = 0, cex.axis = 1.5)

color <- rgb(255, 128, 0, maxColorValue = 255, alpha = 150)
polygon(c(0, x[x<=1], 1), c(0, y[x<=1], 0), col=color, border = color)

lines(x, y, lwd = 2)


# t values
x <- seq(-4, 4, 0.01)
y <- dt(x, df = 19)
plot(1, 1, type = "n", las = 1, xlab = "", ylab = "", bty = "n", yaxt = "n", xaxt = "n", 
     ylim = c(0, 0.4), xlim = c(-4, 4))
axis(1, at = c(-4, 0, 1.5, 4), labels = c("", "0", expression(t[alpha]), ""), lwd.ticks = 0, cex.axis = 1.5)
axis(2, at = c(0, 0.4), labels = NA, lwd.ticks = 0, cex.axis = 1.5)

color <- rgb(255, 128, 0, maxColorValue = 255, alpha = 150)
polygon(c(1.5, x[x>=1.5], 4), c(0, y[x>=1.5], 0), col=color, border = color)
lines(x, y, lwd = 2)

text(x = 2.3, y = 0.12, labels = expression(alpha), cex = 1.5)
segments(x0 = 2.2, x1 = 1.9, y0 = 0.10, y1 = 0.03, lwd = 2)

# chi-squared values
x <- seq(0, 10, 0.01)
y <- dchisq(x, df = 3)
plot(1, 1, type = "n", las = 1, xlab = "", ylab = "", bty = "n", yaxt = "n", xaxt = "n", 
     ylim = c(0, 0.25), xlim = c(0, 10))
axis(1, at = c(0, 6, 10), labels = c("0", expression({X^{2}}[alpha]), ""), lwd.ticks = 0, cex.axis = 1.5)
axis(2, at = c(0, 0.25), labels = NA, lwd.ticks = 0, cex.axis = 1.5)

color <- rgb(255, 128, 0, maxColorValue = 255, alpha = 150)
polygon(c(6, x[x>=6], 10), c(0, y[x>=6], 0), col=color, border = color)
lines(x, y, lwd = 2)

text(x = 6.9, y = 0.08, labels = expression(alpha), cex = 1.5)
segments(x0 = 6.8, x1 = 6.5, y0 = 0.06, y1 = 0.02, lwd = 2)


# F-values
x <- seq(0, 7, 0.01)
y <- df(x, df1 = 3, df2 = 10)
plot(1, 1, type = "n", las = 1, xlab = "", ylab = "", bty = "n", yaxt = "n", xaxt = "n", 
     ylim = c(0, 0.7), xlim = c(0, 7))
axis(1, at = c(0, 2, 7), labels = c("0", expression("F"[.05], "")), lwd.ticks = 0, cex.axis = 1.5)
axis(2, at = c(0, 0.7), labels = NA, lwd.ticks = 0, cex.axis = 1.5)

color <- rgb(255, 128, 0, maxColorValue = 255, alpha = 150)
polygon(c(2, x[x>=2], 7), c(0, y[x>=2], 0), col=color, border = color)
lines(x, y, lwd = 2)

text(x = 2.7, y = 0.25, labels = expression(""[.05]), cex = 1.5)
segments(x0 = 2.6, x1 = 2.3, y0 = 0.20, y1 = 0.04, lwd = 2)

