#!/bin/bash


geneIdx="5"
snpIdx="1"
cat results | awk -v gidx="$geneIdx" '{ print $gidx }' | sort -k 1 | uniq -c | sort -k 1 | awk '{ if ( $1 == 1 ) print $2 }' > genes_with_1_qtls
cat results | awk -v gidx="$geneIdx" '{ print $gidx }' | sort -k 1 | uniq -c | sort -k 1 | awk '{ if ( $1 == 2 ) print $2 }' > genes_with_2_qtls
cat results | awk -v gidx="$geneIdx" '{ print $gidx }' | sort -k 1 | uniq -c | sort -k 1 | awk '{ if ( $1 == 3 ) print $2 }' > genes_with_3_qtls
cat results | awk -v gidx="$geneIdx" '{ print $gidx }' | sort -k 1 | uniq -c | sort -k 1 | awk '{ if ( $1 > 3 ) print $2 }' > genes_with_4_qtls
cat results | awk -v sidx="$snpIdx" '{ print $sidx }' | sort -k 1 | uniq -c | sort -k 1 | awk '{ if ( $1 == 2) print $2 }' > qtls_with_2_genes
cat results | awk -v sidx="$snpIdx" '{ print $sidx }' | sort -k 1 | uniq -c | sort -k 1 | awk '{ if ( $1 == 3 ) print $2 }' > qtls_with_3_genes
cat results | awk -v sidx="$snpIdx" '{ print $sidx }' | sort -k 1 | uniq -c | sort -k 1 | awk '{ if ( $1 > 3 ) print $2 }' > qtls_with_4_genes
