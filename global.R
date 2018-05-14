library(jsonlite)
library(tidyverse)
library(devtools)
library(tidyverse)
#if (!require("devtools")) install.packages("devtools")
#devtools::install_github("Kohze/fireData")
library(fireData)

#api_key <- Sys.getenv("API_KEY")
#project_domain <- Sys.getenv("AUTH_DOMAIN")
#db_url <- Sys.getenv("DATABASE_URL")
#project_id <- Sys.getenv("PROJECT_ID")
#project_url <- Sys.getenv("PROJECT_URL")
#download(project_url, fileName = "demos-5e3db-export")
#paste0(project_url,"/","demos-5e3db-export",".json")

result <- fromJSON(txt = "data/test4.json")
n <- length(result)
df <- setNames(data.frame(matrix(ncol = 14, nrow = n)), c("gender",
                                                         "race",
                                                         "income",
                                                         "age",
                                                         "occupation", 
                                                         "education", 
                                                         "children",
                                                         "marital"))

df$age <- as.integer(df$age)


for (row in 1:length(result)) {
    user <- result[[row]]
        
    if (is.null(user[["Reactions"]]) == F) {
            user["Reactions"] <- NULL
    }
        
    if (is.null(user[["engagement"]]) == F) {
        user["engagement"] <- NULL
    }
        
    if (is.null(user[["interests"]]) == F) {
        user["interests"] <- NULL
    }
    
    if (is.null(user[["Pinned"]]) == F) {
        user["Pinned"] <- NULL
    }
    
    if (is.null(user[["cities"]]) == F) {
        user["cities"] <- NULL
    }
    
    
        
    user <- as.tibble(user)
        
    for (col in colnames(user)) {
        df[row, col] <- user[[col]]
    }
}

# remove NA columns
df <- df[, !colSums(is.na(df))==nrow(df)]

df <- df %>% 
    select(-c(`update preferences`))



    