library(tidyverse)
qplot(iris$Sepal.Length)
ggsave(filename = here::here("figs", "iris_plot.tiff"), device = "tiff")
