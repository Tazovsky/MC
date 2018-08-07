library(data.table)
install.packages("tidyverse")
library(tidyverse)
input.data <- read.csv("DS.csv", sep = ";")
input.data$X <- NULL
input.data$KN25_XXX_30 <- NA

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
                input.data$KN25_XXX_30[i] <- c(input.data$KN_XXX_30[i] + (step/100) * input.data$KN25_XXX_30[i-1])
  }
}
#### 𝑥𝑡 = 𝑜𝑡 + (𝑠/100) ∙ 𝑥𝑡−1
50.50+(25/100)*7.81 ####### works!!!!
