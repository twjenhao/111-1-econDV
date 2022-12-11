library(readxl)
library(dplyr)
library(targets)
library(econDV2)
data9hw1ts <- read.csv("/Users/liurenhao/Documents/GitHub/111-1-econDV/week9/econDV2作業1/中國出口資料原始檔.csv")
data9hw1ts


data9hw1ts |> dplyr::mutate(
  Tatal = `X1.活動物.動物產品`+`X2.植物產品`) -> data9hw1tssum
# Error in compat_lazy_dots(.dots, caller_env(), ...) : 
#   object 'X1.活動物.動物產品' not found

data9hw1ts |> dplyr::mutate(
  "Tatal" = data9hw1ts[[3]]+data9hw1ts[[4]]+data9hw1ts[[5]]+data9hw1ts[[6]]+data9hw1ts[[7]]+data9hw1ts[[8]]+data9hw1ts[[9]]+data9hw1ts[[10]]+data9hw1ts[[11]]+data9hw1ts[[12]]+data9hw1ts[[13]]+data9hw1ts[[14]]+data9hw1ts[[15]]+data9hw1ts[[16]]+data9hw1ts[[17]]+data9hw1ts[[18]]+data9hw1ts[[19]]+data9hw1ts[[20]]+data9hw1ts[[21]]
               ) -> data9hw1tssum  #只有第一個row的加總，且把第一個row的加總都放到個個row裡面
data9hw1tssum

