input <- read_lines("day1.txt")

pos <- 50
loc <- c()

for (i in 1:length(input)){
  if (substr(input[i],1,1) == "L"){
    pos <- (pos - as.numeric(substr(input[i],2,nchar(input[i])))) %% 100
  } else if(substr(input[i],1,1) == "R"){
      pos <- (pos + as.numeric(substr(input[i],2,nchar(input[i])))) %% 100
  }
  loc[i] <- pos
}

count <- sum(loc == 0)
print(count)


cross <- 0
pos <- 50  

for (i in 1:length(input)){
  
  clicks <- as.numeric(substr(input[i],2,nchar(input[i])))
  
  cross <- cross + (clicks %/% 100)
  
  clicks <- clicks %% 100
  
  if (substr(input[i],1,1) == "L"){
    if (pos == 0) {pos <- 100}  
    if (pos - clicks <= 0){
      cross <- cross + 1
    }
    pos <- (pos - clicks) %% 100
  } else if(substr(input[i],1,1) == "R"){
    if (pos + clicks >= 100){
      cross <- cross + 1
    }
    pos <- (pos + clicks) %% 100
  }
}

print(cross)
