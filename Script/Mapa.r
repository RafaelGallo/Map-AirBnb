library(readr)
library(ggplot2)
library(dplyr)
library(scales)

dados <- read_csv("~/Projetos M.L/Mapa airbnb são paulo/AB_NYC_2019.csv")
head(dados)

tail(dados)

str(dados)


ggplot(data = dados) + 
  geom_histogram(aes(x = price), color = "black", fill = "white")+
  labs(x = "Total preços", y = "Total", title = "Preços do APT")

ggplot(data = dados) + 
  geom_boxplot(aes(x = availability_365, y = neighbourhood_group))

ggplot(data = dados) +
  geom_bar(aes(x = neighbourhood), color = "black", fill = "light blue")

ggplot(data = dados) +
  geom_bar(aes(x = room_type), color = "black", fill = "light blue")

ggplot(data = dados) +
  geom_bar(aes(x = neighbourhood_group), color = "black", fill = "light blue")

ggplot(data = dados) + 
  geom_histogram(aes(x = availability_365), color = "black", fill = "white")

plot(dados$minimum_nights)



###################### MAPA de VENDAS ######################
head(dados)

library(plotly)

fig <- dados 
fig <- fig %>%
  plot_ly(
    lat = ~latitude,
    lon = ~longitude,
    marker = list(color = "green"),
    type = 'scattermapbox',
    hovertext = dados[,"price"]) 
fig <- fig %>%
  layout(
    mapbox = list(
      style = 'open-street-map',
      zoom = 10,
      center = list(lon = -73.92589, lat = 40.69266))) 

fig
