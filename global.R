library(httr)
library(jsonlite)
library(tidyverse)
library(devtools)
library(tidyverse)
#library(fireData)


result <- fromJSON(txt = "data/test2.json")

n <- length(result$Users)
df <- setNames(data.frame(matrix(ncol = 14, nrow = n)), c("gender",
                                                         "race",
                                                         "income",
                                                         "age",
                                                         "occupation", 
                                                         "education", 
                                                         "children",
                                                         "marital"))

df$age <- as.integer(df$age)

    for (row in 1:length(result$Users)) {
        user <- result$Users[[row]]
        
        if (is.null(user[["Reactions"]]) == F) {
            user["Reactions"] <- NULL
        }
        
        if (is.null(user[["engagement"]]) == F) {
            user["engagement"] <- NULL
        }
        
        if (is.null(user[["interests"]]) == F) {
            user["interests"] <- NULL
        }
        
        user <- as.tibble(user)
        
        for (col in colnames(user)) {
            df[row, col] <- user[[col]]
        }
    }

# remove NA columns
df <- df[, colSums(is.na(df))<nrow(df)]
df <- df %>% 
    select(-`update preferences`) %>% 
    drop_na()
    

#df$children <- as.factor(df$children)
