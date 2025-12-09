library(tidyverse)
#p1
m <- read_lines("day7.txt") %>% 
  str_split("") %>% 
  do.call(rbind, .)

tach_row <- map_vec(m[1,], ~ ifelse(.x == ".", 0, 1))


split <- 0

for(i in 2:nrow(m)){
  
  crow <- map_vec(m[i,], ~ ifelse(.x == ".", 0, 1)) 
  
  new_tach <- rep(0,length(crow))
  for(j in 1:length(crow)){
    
    if (crow[j] == 1 && tach_row[j] > 0 ){
      split <- split + 1
      
      new_tach[j] <- new_tach[j] - tach_row[j] #old one gone, split left right
      if(j >1){
        new_tach[j-1] <- new_tach[j-1] + tach_row[j]
      }
      if(j < length(crow)){
        new_tach[j+1] <- new_tach[j+1] + tach_row[j]
      }
    }
  }
  
  tach_row <- tach_row + new_tach
}

split %>% print() #p1
sum(tach_row) %>% print() #p2
