## Carregando Pacotes
library(tidyverse)

## Leitura a arrumação dos dados
dados <- readxl::read_xlsx("data-raw/DADOS GERAIS Mestrado 08.07.25.xlsx") |>
  janitor::clean_names() |>
  select(-parcela, -tn, -rep) |>
  mutate(
    bloco = ifelse(bloco == "B3.1", "B3.2",bloco),
    bloco = str_remove(bloco,".[:digit:]$")
    ) |>
  group_by(data,faz,trat,bloco) |>
  summarise(
    across(.cols = peso:e_n_medio, .fns = ~mean(.,na.rm=TRUE),
           .names = "{.col}"
    ), .groups = "drop"
  )

## Olhadela
glimpse(dados)


## "Outliers" de repetições
n_var <- dados |> select(peso:e_n_medio) |> names()
map(n_var, ~{
  dados |>
    group_by() |>
    ggplot(aes(x=!!sym(.x))) +
    geom_histogram(color="black",fill="gray")+
    labs(title = .x) +
    facet_wrap(~data, scale="free")
})

## salvando o banco de dados para análise
write_rds(dados, "data/data-set-principal.rds")
