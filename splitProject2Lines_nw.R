library(igraph)
library(dplyr)
## create example data
project <- c("Project A", "Project B", "Project C", "Project A", "Project A", "Project B", "Resource Management", "Resource Management")
name <- c("Alice", "Bob", "Charlie", "David", "Emily", "Frank", "Grace", "Henry")
role <- c("Manager", "Developer", "Designer", "Developer", "Designer", "Developer", "Manager", "Coordinator")
Importance <- c(1,1,1,1,1,1,1,1)
# create dataframe
df <- data.frame(Project = project, Name = name, Role = role, Importance = Importance)

# filter dataframe by project "Resource Management"
rm_df <- df[df$Project == "Resource Management", ]

# create vertices dataframe with selected columns
vertices <- rm_df %>% 
  select(Name,Role)
df<-data.frame(Name = "Resource Management", Role = "Designer")

vertices <- rbind(vertices,df)

df1 <- data.frame(Name = "Resource", Role = "Designer")
df2 <- data.frame(Name = "Management", Role = "Designer")
vertices <- rbind(vertices, df1, df2)

vertices <- unique(vertices)


# create edges dataframe with selected columns
edges <- rm_df %>% 
  select(Project,Name,Importance,Role)
# make sure all vertex names in the edges dataframe are present in the vertices dataframe
# vertices$ID <- seq_along(vertices$Name) # add an ID column to the vertices dataframe
# edges$ID <- match(edges$Name, vertices$Name) # add an ID column to the edges dataframe by matching vertex names

# create igraph object
g <- graph_from_data_frame(d = edges, vertices = vertices$Name, directed = FALSE)
#set_vertex_attr(g, name = "label", value = c("Resource\n", "Management\n"), index = "Resource Management")



# find index of the "Resource Management" vertex
rm_index <- which(V(g)$name == "Resource Management")

# create new label vector for the vertex
new_label <- c("Resource", "Management")

# set the "label" attribute of the "Resource Management" vertex
V(g)$label[rm_index] <- "Resource Management"

set_vertex_attr(g, "label", value = "Resource
                Management", index = rm_index)


#below lines madde it work
V(g)$label[rm_index] <- "Resource Management"

V(g)$label <- vertices$Name

V(g)$label[rm_index] <- ifelse(V(g)$name[rm_index] == "Resource Management", "Resource\nManagement", V(g)$label[rm_index])


# print igraph object
print(g)
plot(g,vertex.size = 100)
