library("RGA") 
rga_auth <- authorize(client.id = "your client ID", client.secret = "your client secret")

#1 Downloading the main metrics of your site
report_data <- get_ga(profileId = "ga:View ID",
                      start.date    = "yyyy-mm-dd",
                      end.date      = "yyyy-mm-dd",
                      dimensions  = "ga:month",
                      metrics     = "ga:sessions,
                      ga:users,
                      ga:percentNewSessions,
                      ga:bounceRate,
                      ga:avgSessionDuration,
                      ga:pageviewsPerSession",
                      fetch.by      = "month",
                      samplingLevel =  "HIGHER_PRECISION",
                      token = rga_auth)
names(report_data)[1] <- "main_data"

#2 Downloading session metrics according to mediums. You can add other mediums.
report_data <- cbind(report_data,"medium")

organic <- get_ga(profileId = "ga:View ID",
                  start.date    = "yyyy-mm-dd",
                  end.date      = "yyyy-mm-dd",
                  dimensions  = "ga:month",
                  metrics     = "ga:sessions",
                  filters = "ga:medium==organic",
                  fetch.by      = "month",
                  samplingLevel =  "HIGHER_PRECISION",
                  token = rga_auth)
organic <- organic[-1] 
names(organic)[1] <- "organic"
report_data <- cbind(report_data, organic)

direct <- get_ga(profileId = "ga:View ID",
                 start.date    = "yyyy-mm-dd",
                 end.date      = "yyyy-mm-dd",
                 dimensions  = "ga:month",
                 metrics     = "ga:sessions",
                 filters = "ga:medium==(none)",
                 fetch.by      = "month",
                 samplingLevel =  "HIGHER_PRECISION",
                 token = rga_auth)
direct <- direct[-1] 
names(direct)[1] <- "direct"
report_data <- cbind(report_data, direct)

referral <- get_ga(profileId = "ga:View ID",
                   start.date    = "yyyy-mm-dd",
                   end.date      = "yyyy-mm-dd",
                   dimensions  = "ga:month",
                   metrics     = "ga:sessions",
                   filters = "ga:medium==referral",
                   fetch.by      = "month",
                   samplingLevel =  "HIGHER_PRECISION",
                   token = rga_auth)
referral <- referral[-1] 
names(referral)[1] <- "referral"
report_data <- cbind(report_data, referral)

#3 Downloading session metric according to source of organic. You can use this example for downloading session metric of other sources and mediums.
report_data <- cbind(report_data,"source_organic")

google <- get_ga(profileId = "ga:View ID",
                 start.date    = "yyyy-mm-dd",
                 end.date      = "yyyy-mm-dd",
                 dimensions  = "ga:month",
                 metrics     = "ga:sessions",
                 filters = "ga:source=@google;ga:medium==organic",
                 fetch.by      = "month",
                 samplingLevel =  "HIGHER_PRECISION",
                 token = rga_auth)
google <- google[-1] 
names(google)[1] <- "google"
report_data <- cbind(report_data, google)


#4 It’s example of downloading main metrics of organic. You can use it for downloading main metrics for other mediums or sources
report_data <- cbind(report_data,"organic_metrics")

organic_metrics <- get_ga(profileId = "ga:View ID",
                          start.date    = "yyyy-mm-dd",
                          end.date      = "yyyy-mm-dd",
                          dimensions  = "ga:month",
                          metrics     = "ga:users,
                          ga:percentNewSessions,
                          ga:bounceRate,
                          ga:avgSessionDuration,
                          ga:pageviewsPerSession",
                          filters = "ga:medium==organic",
                          fetch.by      = "month",
                          samplingLevel =  "HIGHER_PRECISION",
                          token = rga_auth)
organic_metrics <- organic_metrics[-1] 
report_data <- cbind(report_data, organic_metrics)

#5 Downloading not mobile traffic
report_data <- cbind(report_data,"")

not_mobile_traffic <- get_ga(profileId = "ga:View ID",
                             start.date    = "yyyy-mm-dd",
                             end.date      = "yyyy-mm-dd",
                             dimensions  = "ga:month",
                             metrics     = "ga:sessions",
                             filters = "ga:deviceCategory==desktop",
                             fetch.by      = "month",
                             samplingLevel =  "HIGHER_PRECISION",
                             token = rga_auth)
not_mobile_traffic <- not_mobile_traffic[-1] 
names(not_mobile_traffic)[1] <- "not_mobile_traffic"
report_data <- cbind(report_data, not_mobile_traffic)

#16 Downloading mobile organic according to source. You can add your sources.
report_data <- cbind(report_data,"mobile_organic")
google_mobile <- get_ga(profileId = "ga:View ID",
                        start.date    = "yyyy-mm-dd",
                        end.date      = "yyyy-mm-dd",
                        dimensions  = "ga:month",
                        metrics     = "ga:sessions",
                        filters = "ga:medium==organic;ga:deviceCategory=!desktop;ga:source=@google",
                        fetch.by      = "month",
                        samplingLevel =  "HIGHER_PRECISION",
                        token = rga_auth)
google_mobile <- google_mobile[-1] 
names(google_mobile)[1] <- "yandex"
report_data <- cbind(report_data, google_mobile)

mobile_organic <- get_ga(profileId = "ga:View ID",
                         start.date    = "yyyy-mm-dd",
                         end.date      = "yyyy-mm-dd",
                         dimensions  = "ga:month",
                         metrics     = "ga:sessions",
                         filters = "ga:medium==organic;ga:deviceCategory==desktop",
                         fetch.by      = "month",
                         samplingLevel =  "HIGHER_PRECISION",
                         token = rga_auth)
mobile_organic <- mobile_organic[-1] 
names(mobile_organic)[1] <- "mobile_organic"
report_data <- cbind(report_data, mobile_organic)

#6 Downloading session metric according to browsers. You can add other browsers.
report_data <- cbind(report_data,"browsers")

Chrome <- get_ga(profileId = "ga:View ID",
                 start.date    = "yyyy-mm-dd",
                 end.date      = "yyyy-mm-dd",
                 dimensions  = "ga:month",
                 metrics     = "ga:sessions",
                 filters = "ga:browser==Chrome",
                 fetch.by      = "month",
                 samplingLevel =  "HIGHER_PRECISION",
                 token = rga_auth)
Chrome <- Chrome[-1] 
names(Chrome)[1] <- "Chrome"
report_data <- cbind(report_data, Chrome)

Safari <- get_ga(profileId = "ga:View ID",
                 start.date    = "yyyy-mm-dd",
                 end.date      = "yyyy-mm-dd",
                 dimensions  = "ga:month",
                 metrics     = "ga:sessions",
                 filters = "ga:browser==Safari",
                 fetch.by      = "month",
                 samplingLevel =  "HIGHER_PRECISION",
                 token = rga_auth)
Safari <- Safari[-1] 
names(Safari)[1] <- "Safari"
report_data <- cbind(report_data, Safari)


Internet_Explorer <- get_ga(profileId = "ga:View ID",
                            start.date    = "yyyy-mm-dd",
                            end.date      = "yyyy-mm-dd",
                            dimensions  = "ga:month",
                            metrics     = "ga:sessions",
                            filters = "ga:browser==Internet Explorer",
                            fetch.by      = "month",
                            samplingLevel =  "HIGHER_PRECISION",
                            token = rga_auth)
Internet_Explorer <- Internet_Explorer[-1] 
names(Internet_Explorer)[1] <- "Internet_Explorer"
report_data <- cbind(report_data, Internet_Explorer)


report_data <- t(report_data)
write.csv(report_data,file = "report.csv")


