# "Tidier" Project by Michael
# 27/05/2020

# Load data
load(here::here("01_data","DSP_original.Rdata"))

DSP_rec <- DSP_Dataset_v1 %>% 
  select(country_name, country_text_id, country_id, year, 
         v2smgovdom, v2smregcon, v2smhargr_0, v2smpolsoc)
  
# Save recoded dataset
save(DSP_rec, file = here::here("01_data","DSP_recoded.Rdata"))

fig1 <- ggplot(DSP_rec)+geom_histogram(mapping=aes(x=v2smgovdom), binwidth=0.2)+labs(title="Histogram of government spreading of fakes domestically",x="",y="Count")+theme_bw()
ggsave(plot=fig1,filename="Fig1.tiff",device="tiff", dpi=600, compression="lzw",height=5, width=5, units="in")

fig2_dat <- DSP_rec %>%group_by(year) %>% summarize(avg_fakes=mean(v2smgovdom, na.rm=TRUE))
fig2 <- ggplot(fig2_dat, mapping=aes(x=year, y=avg_fakes))+geom_point()+geom_smooth()+labs(title="Government spreading of fakes domestically over time", x ="Year", y="Yearly average of government spreading fake news")+theme_bw()
ggsave(plot=fig2,filename="Fig2.tiff",device="tiff",dpi=600,compression="lzw",height=5, width=5, units="in")

fig3_dat <- DSP_rec %>% group_by(year) %>% summarize(avg_harass=mean(v2smhargr_0, na.rm=TRUE))
fig3 <- ggplot(fig3_dat, mapping=aes(x=year, y=avg_harass))+geom_point()+geom_smooth()+labs(title="Women online harassment over time",x="Year",y="Yearly average of Women online harassment")+theme_bw()
ggsave(plot=fig3,filename="Fig3.tiff",device="tiff", dpi=600, compression="lzw",height=5, width=5, units="in"); DSP_rec <- DSP_rec %>% filter(!country_name %in% c("Tunisia", "Uganda", "Zambia", "Zimbabwe", "Kenya", "Angola"))

DSP_rec <- DSP_rec %>% filter(year > 2007)
fit1 <- lm(v2smgovdom~v2smregcon, data=DSP_rec)
fit2 <- lm(v2smgovdom~v2smregcon+country_name, data=DSP_rec)
fit3 <- lm(v2smgovdom~v2smregcon+country_name+factor(year), data=DSP_rec)
stargazer(fit1, fit2, fit3,out="Table1.html",type="html", style="apsr",omit=c("country_name", "year"),add.lines=list(c("Country FE", "No", "Yes", "Yes"),c("Year FE", "No", "No", "Yes")))