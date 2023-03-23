# Script information ------------------------------------------------------
#' Project title: Pretvaranje eksel tabele u niz (citanje u dva smera).
#' Script name: main.R
#' Date created: 2023-3-21
#' Author: Milica
#' Script purpose: Obrada eksel podataka

# Ucitaj potrebne biblioteke ----------------------------------------------
library(readxl)
library(xlsx)
library(writexl)

procitanXls <- read_excel("data/uNizUlazA.xls", col_names = FALSE)
myList <- list()

for(r in 1:50){ # 1:nrow(procitanXls) i 1:ncol(procitanXls) u opstem slucaju; ovde specificno menjam smer citanja tabele na pola niza pa zato tacan broj
  for (k in 1:10){ # 10:1 za negativne brojeve; 1:10 za pozitivne brojeve; voditi racuna u proveri i da negativna nula nema u napravljenom nizu (zato nema tacno 1000 nego 999 za razliku od tabele)
    myList <- append(myList, procitanXls[k,r])
  }
}

df <- data.frame(myList)
df2 <- t(df[])

# Sacuvaj izlazni fajl ----------------------------------------------------
write.xlsx(df2, file="data/uNizIzlazA.xlsx", col.names=FALSE)
