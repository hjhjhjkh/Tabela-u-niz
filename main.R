# Script information ------------------------------------------------------

#' Project title: 
#' Script name: main.R
#' Date created: 2023-3-21
#' Author: Milica
#' Script purpose: obrada eksela

# Ucitaj potrebne biblioteke ----------------------------------------------
library(readxl)
library(xlsx)
library(writexl)

procitanXls <- read_excel("data/uNizUlazA.xls", col_names = FALSE)
myList <- list()

for(k in 1:50){
  for (r in 1:10){ # 10:1 za negativne brojeve; 1:10 za pozitivne brojeve; voditi racuna u proveri i da negativna nula nema u (zato nema tacno 1000 nego 999 za razliku od tabele)
    myList <- append(myList, procitanXls[k,r])
  }
}
df <- data.frame(myList)
df2 <- t(df[])

# Sacuvaj izlazni fajl ----------------------------------------------------
write.xlsx(df2, file="data/uNizIzlazA.xlsx", col.names=FALSE)