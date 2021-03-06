# Git
What the Package Does (One Line, Title Case)
title: "projeto_r2"
output: html_document
---

## R Markdown

Bases de dados necessárias

```{r setup, include=TRUE}

library(tidyverse)

```


```{r, include=TRUE}
load("atlas_ambiental.RData")
load("perfil_investidor_aplicacao.RData")
library(tidyverse)
```

## Padronização ------------------------------------------------------------

#Dados estudados:


```{r, echo=TRUE}
library(kableExtra)
atlas_ambiental %>% 
  kable() %>%
  kable_styling(bootstrap_options = "striped", 
                full_width = T, 
                font_size = 12)
```
## Observando as variáveis com auxílio de um boxplot


```{r, echo=TRUE}
library(knitr)
library(FactoMineR)
library(ggrepel)
library(plotly)
library(reshape2)
library(aplpack)
library(robustX)
library(sjPlot)
library(car)
library(rgl)

atlas_ambiental[, 2:11] %>% 
  melt(id.vars = "distritos") %>% 
  ggplot() +
  geom_boxplot(aes(x = variable, y = value, fill = variable)) +
  labs(x = "Variáveis",
       y = "Valores") +
  theme_bw()

```
## Padronização Z-Scores
```{r, echo=TRUE}
atlas_ambiental[, 3:11] %>% 
  scale() %>%
  kable() %>%
  kable_styling(bootstrap_options = "striped", 
                full_width = T, 
                font_size = 12)
```

#É importante notar que a padronização não altera a distribuição das variáveis.
#O que a padronização zscores altera é a magnitude das variáveis, ao mudar 
#suas médias para 0 e desvios-padrão para 1.

#Tomemos, por exemplo, as variáveis renda e quota.

```{r, echo=TRUE}
renda <- atlas_ambiental$renda
quota <- atlas_ambiental$quota

z_renda <- scale(renda)
z_quota <- scale(quota)

```

#Distribuição da variável renda:

```{r, echo=TRUE}
data.frame(renda) %>% 
  ggplot() +
  geom_density(aes(x = renda), color = "darkorchid", size = 1.2) +
  labs(x = "Renda",
       y = "Densidade") +
  theme_bw()

round(mean(renda), digits = 15)
round(sd(renda), digits = 15)

```



#Distribuição da variável renda padronizada (z_renda):
```{r pressure, echo=TRUE}

round(mean(z_renda), digits = 15)
round(sd(z_renda), digits = 15)
data.frame(z_renda) %>% 
  ggplot() +
  geom_density(aes(x = z_renda), color = "darkorchid", size = 1.2) +
  labs(x = "Renda",
       y = "Densidade") +
  theme_bw()


```
# Outliers ----------------------------------------------------------------

#Prováveis outliers univariados (renda)

```{r , echo=TRUE}
round(mean(z_quota), digits = 15)
round(sd(z_quota), digits = 15)

ggplotly(
  data.frame(renda) %>% 
    melt() %>% 
    ggplot() +
    geom_boxplot(aes(x = variable, y = value), fill = "darkorchid") +
    labs(x = NULL,
         y = NULL) +
    theme_bw()
)


```
#ATENÇÃO: O comando a seguir possui propósitos didáticos, demonstrando o 
#posicionamento de cada observação DA VARIÁVEL RENDA no boxplot

```{r, echo=TRUE}

ggplotly(
  data.frame(renda) %>% 
    melt() %>% 
    ggplot() +
    geom_boxplot(aes(x = variable, y = value), fill = "darkorchid") +
    geom_point(aes(x = variable, y = value), color = "black", alpha = 0.5) +
    labs(x = NULL,
         y = NULL) +
    theme_bw()
)

```

