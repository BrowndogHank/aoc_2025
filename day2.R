library(tidyverse)
input <- read_lines("day2.txt")%>% 
  str_split(",") %>% 
  unlist()


target <- c()
for (i in 1:length(input)){
  
  line <- input[[i]] %>% 
    str_split("-") %>% 
    unlist()
  
  r <- seq(line[1],line[2], by = 1)
  
  dupe <- c()
  for (j in 1:length(r)){
    dupe[j] <- str_extract(r[j], "^(\\d+)\\1$")
  }
  
  dupe <- dupe[!is.na(dupe)]
  target <- append(target, dupe)
}

#glorious R 
target %>% as.numeric() %>% sum() %>% print()

# p2 ----------------------------------------------------------------------

target <- c()
for (i in 1:length(input)){
  
  line <- input[[i]] %>% 
    str_split("-") %>% 
    unlist()
  
  r <- seq(line[1],line[2], by = 1)
  
  dupe <- c()
  for (j in 1:length(r)){
    dupe[j] <- str_extract(r[j], "^(\\d+)\\1+$")
  }
  
  dupe <- dupe[!is.na(dupe)]
  target <- append(target, dupe)
}

#glorious R 
target %>% as.numeric() %>% sum() %>% print()
