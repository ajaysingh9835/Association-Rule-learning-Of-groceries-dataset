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
association_rules = eclat(data = Receipts, parameter = list(support = 0.006,minlen=2))
#lift=confidence(item1-->item2)/support(item2)
# Visualising the results

inspect(sort(association_rules, by = 'support')[1:10])

plot(association_rules[1:10],
     
     method = "graph",
     
     control = list(type = "items"))
plot(association_rules,jitter=0)