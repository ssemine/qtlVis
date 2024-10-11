library(ggplot2)
library(dplyr)
library(scales)
library(plotly)

setwd("~/uq/research/all")
df <- read.table("results", sep=' ', header=TRUE)
df$D <- df$START - df$BP
df$D_kb <- df$D / 1000
df$D_mb <- df$D_kb / 1000
df <- df %>%
  mutate(
    A1C = nchar(A1),
    A2C = nchar(A2)
  )
genes_with_1_qtls <- read.table("genes_with_1_qtls", header=FALSE)
genes_with_2_qtls <- read.table("genes_with_2_qtls", header=FALSE)
genes_with_3_qtls <- read.table("genes_with_3_qtls", header=FALSE)
genes_with_4_qtls <- read.table("genes_with_4_qtls", header=FALSE)
qtls_with_2_genes <- read.table("qtls_with_2_genes", header=FALSE)
qtls_with_3_genes <- read.table("qtls_with_3_genes", header=FALSE)
df$ROUND <- as.numeric(df$ROUND)
df_round <- df[df$ROUND > 1, ]
df_round_1 <- df[df$ROUND == 1, ]
df_round_2 <- df[df$ROUND == 2, ]
df_round_3 <- df[df$ROUND == 3, ]
df$ROUND <- as.factor(df$ROUND)
df_round$P_D <- df_round$P_C / df_round$P
qtls_2_df <- df %>%
  filter(SNP %in% qtls_with_2_genes$V1)
qtls_3_df <- df %>%
  filter(SNP %in% qtls_with_3_genes$V1)
genes_1_df <- df %>%
  filter(GENE %in% genes_with_1_qtls$V1)
genes_2_df <- df %>%
  filter(GENE %in% genes_with_2_qtls$V1)
genes_3_df <- df %>%
  filter(GENE %in% genes_with_3_qtls$V1)
genes_4_df <- df %>%
  filter(GENE %in% genes_with_4_qtls$V1)







