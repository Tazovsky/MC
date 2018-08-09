

library(data.table)
# install.packages("tidyverse")
library(tidyverse)
input.data <- utils::read.csv("DS.csv", sep = ";", dec = ",", stringsAsFactors = FALSE)
input.data$X <- NULL
input.data$KN25_XXX_30 <- 0 # why NA not 0?
input.data

to.num <- c("KN_XXX_30", "VA_KKK_15", "LP_KKK_10")

for (nm in to.num)
  input.data[[nm]] <- sapply(input.data[[nm]], function(x) {
    if (is.na(x) || length(x) == 0)
      0
    else
      as.numeric(x)
  })

options(scipen=999)
Modifier <- function(input.data,
                     min               =  0,
                     max               = 90,
                     step              = 25,
                     threshold         = 0.8,
                     dates.column.name = "Date",
                     cut.points        = c(NA, NA),
                     sep               = ";",
                     dec               = ",") {
  for (i in 1:nrow(input.data)) {
    
    input.data$KN25_XXX_30[i] <- 
      c(input.data$KN_XXX_30[i] + (step / 100) * ifelse(
        length(input.data$KN25_XXX_30[i - 1]) == 0,
        0,
        input.data$KN25_XXX_30[i - 1]
      ))
    
  }
  
  
  input.data
}

res <- Modifier(input.data)

#### 𝑥𝑡 = 𝑜𝑡 + (𝑠/100) ∙ 𝑥𝑡−1
50.50 + (25 / 100) * 7.81 ####### works!!!!