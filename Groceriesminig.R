
install.packages("arules", dependencies = TRUE)
install.packages("arulesViz")
library(arules)

Receipts = read.csv('groceries.csv', header = FALSE)
Receipts = read.transactions('groceries.csv', sep = ',', rm.duplicates = TRUE)
summary(Receipts)
itemFrequencyPlot(Receipts, topN = 40)

# Training Apriori on the dataset)
#support(item)=#transactions containing item/#transactions
#confidence(item1--> item2)=#transactions containing item1 and item2/#transactions containing item1
association_rules = apriori(data = Receipts, parameter = list(support = 0.007, confidence = 0.2))
#lift=confidence(item1-->item2)/support(item2)
# Visualising the results
library(arulesViz)
inspect(sort(association_rules, by = 'lift')[2:20])

plot(association_rules[1:40],
     
     method = "graph",
     
     control = list(type = "items"))
plot(association_rules,jitter=0)


#Training Eclat on the dataset
association_rules2 = eclat(data = Receipts, parameter = list(support = 0.006,minlen=2))

# Visualising the results
library(arulesViz)
inspect(sort(association_rules2, by = 'support')[2:20])

plot(association_rules2[1:40],
     
     method = "graph",
     
     control = list(type = "items"))
plot(association_rules2,jitter=0)








