# Messy Data Project

library('tidyverse')
setwd("C:\Users\andre\Dropbox\Lavoro\Teaching\1-templates-lessons\messy-tidy-projects\Messy Data Project")
load("DSP_original.Rdata")
DSP_rec <- DSP_Dataset_v1 %>% 
  select(country_name, country_text_id, country_id, year, v2smgovdom, v2smregcon, v2smhargr_0, v2smpolsoc) %>% 
  mutate(
    country_name = as.factor(country_name),
    v2smgovdom = gov_fakes * (-1),
    v2smpolsoc = polariz * (-1)
  )

fig1 <- ggplot(DSP_rec) + 
  geom_histogram(mapping = aes(x = v2smgovdom), binwidth = 0.2) + 
  labs(title = "Histogram of government spreading of fakes domestically", 
       x  = "", 
       y = "Count") + 
  theme_bw()
fig1
ggsave(plot = fig1,
       filename = "Fig1.tiff",
       device = "tiff", dpi = 600, compression = "lzw",
       height = 5, width = 5, units = "in"
)
