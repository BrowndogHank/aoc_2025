library(tidyverse)
#p1
m <- read_lines("day4.txt") %>% 
  str_split("") %>% 
  do.call(rbind, .)

m <- (m == "@") * 1

#fluffer row of 0's
core <- m
m <- matrix(0, nrow = nrow(core)+2, ncol = ncol(core)+2) #extra row column trick
m[2:(nrow(core)+1), 2:(ncol(core)+1)] <- core

access <- 0

for (i in 2:(nrow(m)-1)){
  for (j in 2:(ncol(m)-1)){
      if(m[i,j]==1 && (sum(m[(i-1):(i+1),(j-1):(j+1)])-m[i,j])<4){
        access <- access + 1
        #cat("found:", i, "col:", j, "sum:", access)
      }
    }
  }
access

#p2
start <- sum(m)
done <- FALSE
while (!done){
  done <- TRUE
  state <- m
  for (i in 2:(nrow(m)-1)){
    for (j in 2:(ncol(m)-1)){
        if(m[i,j]==1 && (sum(m[(i-1):(i+1),(j-1):(j+1)])-m[i,j])<4){
          state[i,j] <- 0
          done<-FALSE
      }
    }
  }
  m <- state
}
start - sum(m)