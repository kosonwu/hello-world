# parallel computation
library("doParallel", lib.loc="C:/Program Files/R/R-3.3.1/library")
library("doSNOW", lib.loc="C:/Program Files/R/R-3.3.1/library")

# 偵測Cores
detectCores()
# set available core
cl <- makeCluster(4)
# unix OS
# registerDoParallel(cl)
# windows OS
registerDoSNOW(cl)

vector <- seq(1:10000)
# 平行運算
# 'cbind' and 'rbind' combine vectors into a matrix, 'c' results into a vector
# %dopar% evalutes it in parallel,  %do% evaluates the expression sequentially.
system.time(
  result <- foreach(i = 1:length(vector), .combine = rbind)
  %dopar%  {
    return(vector[i] / sqrt(vector[i]) ^ 3)
  })
stopCluster(cl)