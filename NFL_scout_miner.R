require(tm)
library(qdap)
library(SnowballC)

setwd("C:\\Users\\ojd002\\Desktop\\trey_smith\\")

doc1 <- read.delim("trey_smith1.txt")
doc2 <- read.delim("trey_smith2.txt")
doc3 <- read.delim("trey_smith3.txt")

docs<-c(doc1, doc2, doc3)
class(docs)

doc_corpus <- VCorpus(VectorSource(docs))
doc_corpus[[1]]$content

#doc_corpus <- tm_corpus <- tm_map(doc_corpus, PlainTextDocument)

doc_corpus<-tm_map(doc_corpus, tolower)
doc_corpus[[1]]

doc_corpus<-tm_map(doc_corpus, removeWords, stopwords("english"))
doc_corpus[[1]]

doc_corpus<-tm_map(doc_corpus, stripWhitespace)
doc_corpus[[1]]

doc_corpus<-tm_map(doc_corpus, removePunctuation)
doc_corpus[[2]]

doc_corpus<-tm_map(doc_corpus, stemDocument)
doc_corpus[[1]]$content

dtm <- TermDocumentMatrix(doc_corpus)

as.matrix(dtm)

frequent_terms <- freq_terms(dtm, 3)

plot(frequent_terms)