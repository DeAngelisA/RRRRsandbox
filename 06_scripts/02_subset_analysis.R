# "Tidier" Project by Michael
# 27/05/2020

DSP_rec <- subset(DSP_rec, select=c(country_name, country_text_id, country_id, year, 
                                                  v2smgovdom, v2smgovdom, v2smgovsmmon, v2smregcon, v2smonper, v2smmefra, v2smhargr_0, v2smhargr_1, v2smhargr_2, v2smhargr_6, v2smarrest_ord, v2smpolsoc, v2smpolhate_ord))
DSP_rec$country_name <- as.factor(DSP_rec$country_name)
DSP_rec$v2smgovdom.1 <- NULL
DSP_rec$v2smpolsoc <- DSP_rec$v2smpolsoc*(-1)

# This is our new line

# This is one more change (done by a collaborator)
