#I use page “contacts” for example.
library("RGA")
rga_auth <- authorize(client.id = "your Client ID", client.secret = "your client secret")

#1 Downloading pageviews metric for page or section of your web-site.
content_data <- get_ga(profileId = "ga:View ID",
                       start.date    = "yyyy-mm-dd",
                       end.date      = "yyyy-mm-dd",
                       dimensions  = "ga:month",
                       metrics     = "ga:pageviews",
                       filters = "ga:pagePathLevel1==/contacts/",              
                       fetch.by      = "month",
                       samplingLevel =  "HIGHER_PRECISION",
                       token = rga_auth)
names(content_data)[1] <- "pageviews"
names(content_data)[2] <- "contacts"

all_pageviews <- get_ga(profileId = "ga:View ID",
                        start.date    = "yyyy-mm-dd",
                        end.date      = "yyyy-mm-dd",
                        dimensions  = "ga:month",
                        metrics     = "ga:pageviews",
                        fetch.by      = "month",
                        samplingLevel =  "HIGHER_PRECISION",
                        token = rga_auth)
all_pageviews <- all_pageviews[-1] 
names(all_pageviews)[1] <- "all"
content_data <- cbind(content_data, all_pageviews)

#2 Downloading sessions metric for page or section of your web-site.
content_data <- cbind(content_data,"sessions")

contacts_sessions <- get_ga(profileId = "ga:View ID",
                            start.date    = "yyyy-mm-dd",
                            end.date      = "yyyy-mm-dd",
                            dimensions  = "ga:month",
                            metrics     = "ga:sessions",
                            filters = "ga:landingPagePath=@/contacts/",              
                            fetch.by      = "month",
                            samplingLevel =  "HIGHER_PRECISION",
                            token = rga_auth)
contacts_sessions <- contacts_sessions[-1] 
names(contacts_sessions)[1] <- "contacts"
content_data <- cbind(content_data, contacts_sessions)

all_sessions <- get_ga(profileId = "ga:View ID",
                       start.date    = "yyyy-mm-dd",
                       end.date      = "yyyy-mm-dd",
                       dimensions  = "ga:month",
                       metrics     = "ga:sessions",
                       fetch.by      = "month",
                       samplingLevel =  "HIGHER_PRECISION",
                       token = rga_auth)
all_sessions <- all_sessions[-1] 
names(all_sessions)[1] <- "all"
content_data <- cbind(content_data, all_sessions)

#3 Downloading sessions metric for page or section of your web-site according to mediums.
content_data <- cbind(content_data,"organic to pages")

contacts_organic <- get_ga(profileId = "ga:View ID",
                           start.date    = "yyyy-mm-dd",
                           end.date      = "yyyy-mm-dd",
                           dimensions  = "ga:month",
                           metrics     = "ga:sessions",
                           filters = "ga:landingPagePath=@/contactst/;ga:medium==organic",              
                           fetch.by      = "month",
                           samplingLevel =  "HIGHER_PRECISION",
                           token = rga_auth)
contacts_organic <- contacts_organic[-1] 
names(contacts_organic)[1] <- "contacts"
content_data <- cbind(content_data, contacts_organic)

all_organic <- get_ga(profileId = "ga:View ID",
                      start.date    = "yyyy-mm-dd",
                      end.date      = "yyyy-mm-dd",
                      dimensions  = "ga:month",
                      metrics     = "ga:sessions",
                      filters = "ga:medium==organic",
                      fetch.by      = "month",
                      samplingLevel =  "HIGHER_PRECISION",
                      token = rga_auth)
all_organic <- all_organic[-1] 
names(all_organic)[1] <- "all"
content_data <- cbind(content_data, all_organic)

#4 Downloading session metric for page or section according to medium and source.
content_data <- cbind(content_data,"organic to the main pages")
content_data <- cbind(content_data,"contacts")

contacts_google <- get_ga(profileId = "ga:View ID",
                          start.date    = "yyyy-mm-dd",
                          end.date      = "yyyy-mm-dd",
                          dimensions  = "ga:month",
                          metrics     = "ga:sessions",
                          filters = "ga:landingPagePath=@/contacts/;ga:medium==organic;ga:source=@google",              
                          fetch.by      = "month",
                          samplingLevel =  "HIGHER_PRECISION",
                          token = rga_auth)
contacts_google <- contacts_google[-1] 
names(contacts_google)[1] <- "google"
content_data <- cbind(content_data, contacts_google)

#5 Downloading users metric for page or section.
content_data <- cbind(content_data,"users")

contacts_users <- get_ga(profileId = "ga:View ID",
                         start.date    = "yyyy-mm-dd",
                         end.date      = "yyyy-mm-dd",
                         dimensions  = "ga:month",
                         metrics     = "ga:users",
                         segment = "users::condition::ga:landingPagePath=@/contacts/",              
                         fetch.by      = "month",
                         samplingLevel =  "HIGHER_PRECISION",
                         token = rga_auth)
contacts_users <- contacts_users[-1] 
names(contacts_users)[1] <- "contacts"
content_data <- cbind(content_data, contacts_users)

all_users <- get_ga(profileId = "ga:View ID",
                    start.date    = "yyyy-mm-dd",
                    end.date      = "yyyy-mm-dd",
                    dimensions  = "ga:month",
                    metrics     = "ga:users",
                    fetch.by      = "month",
                    samplingLevel =  "HIGHER_PRECISION",
                    token = rga_auth)
all_users <- all_users[-1] 
names(all_users)[1] <- "all"
content_data <- cbind(content_data, all_users)

#6 Downloading bounce Rate metric for page or section.
content_data <- cbind(content_data,"bounceRate")

contacts_bounceRate <- get_ga(profileId = "ga:View ID",
                              start.date    = "yyyy-mm-dd",
                              end.date      = "yyyy-mm-dd",
                              dimensions  = "ga:month",
                              metrics     = "ga:bounceRate",
                              filters = "ga:landingPagePath=@/contacts/",              
                              fetch.by      = "month",
                              samplingLevel =  "HIGHER_PRECISION",
                              token = rga_auth)
contacts_bounceRate <- contacts_bounceRate[-1] 
names(contacts_bounceRate)[1] <- "contacts"
content_data <- cbind(content_data, contacts_bounceRate)



