## Carregando Pacotes
library(tidyverse)

# ## Leitura a arrumação dos dados
# dados <- readxl::read_xlsx("data-raw/DADOS GERAIS Mestrado 08.07.25.xlsx") |>
#   janitor::clean_names() |>
#   select(-parcela, -tn, -rep) |>
#   mutate(
#     bloco = ifelse(bloco == "B3.1", "B3.2",bloco),
#     bloco = str_remove(bloco,".[:digit:]$"),
#     dose = case_when(
#       trat == 1 ~ 0,
#       trat == 2 ~0.04,
#       trat == 3 ~0.08,
#       trat == 4 ~0.16,
#       trat == 5 ~0.32,
#       trat == 6 ~0.64,
#       trat == 7 ~999,
#       trat == 8 ~999,
#     )
#     ) |>
#   group_by(data,faz,trat,dose,bloco) |>
#   summarise(
#     across(.cols = peso:e_n_medio, .fns = ~mean(.,na.rm=TRUE),
#            .names = "{.col}"
#     ), .groups = "drop"
#   )
#
# ## Olhadela
# glimpse(dados)
#
#
# ## "Outliers" de repetições
# n_var <- dados |> select(peso:e_n_medio) |> names()
# map(n_var, ~{
#   dados |>
#     group_by() |>
#     ggplot(aes(x=!!sym(.x))) +
#     geom_histogram(color="black",fill="gray")+
#     labs(title = .x) +
#     facet_wrap(~data, scale="free")
# })
#
# ## salvando o banco de dados para análise
# write_rds(dados, "data/data-set-principal.rds")


# - de altura até ATR (Análise tecnológica )
# - de TCH1 a TCH6 - (Produção);
# - de A até T° foliar -(Análise Trocas Gasosas);
# - de SPS até Ni - (Análise enzimática)

## Leitura DA BASE COMPLETA
dados <- readxl::read_xlsx("data-raw/DADOS GERAIS Mestrado 24.11.25.xlsx") |>
  janitor::clean_names() |>
  mutate(
    dose = case_when(
      trat == 1 ~ 0,
      trat == 2 ~0.04,
      trat == 3 ~0.08,
      trat == 4 ~0.16,
      trat == 5 ~0.32,
      trat == 6 ~0.64,
      trat == 7 ~999,
      trat == 8 ~999,
    ), .after = "trat"
  )
glimpse(dados)

# CRIANDO A BASE TECNOLOGICA
bases_tecnologica <- dados |>
  filter(tipo == "tecnologica") |>
  select(id:atr)  |>
  group_by(data,faz,trat,dose,bloco) |>
  summarise(
    across(.cols = peso:atr, .fns = ~mean(.,na.rm=TRUE),
           .names = "{.col}"
    ), .groups = "drop"
  )
glimpse(bases_tecnologica)

## salvando o banco de dados para análise
write_rds(bases_tecnologica, "data/data-set-tecnologica.rds")

# CRIANDO A BASE PRODUCAO
bases_producao <- dados |>
  filter(tipo == "producao") |>
  select(id:parcela,tch1:tah6) |>
  mutate(tch_media = (tch1+tch2+tch3+tch4+tch5+tch6)/6 ,
         tah_media = (tah1+tah2+tah3+tah4+tah5+tah6)/6)
glimpse(bases_producao)

## salvando o banco de dados para análise
write_rds(bases_producao, "data/data-set-producao.rds")

# CRIANDO A BASE TROCA-GASOSA
bases_troca <- dados |>
  filter(tipo == "gasosas") |>
  select(id:parcela,a:t_foliar)
glimpse(bases_troca)

## salvando o banco de dados para análise
write_rds(bases_troca, "data/data-set-trocas-gasosas.rds")

# CRIANDO A BASE ENZIMAS
bases_enzima <- dados |>
  filter(tipo == "enzima") |>
  select(id:parcela,sps:ni)
glimpse(bases_enzima)

## salvando o banco de dados para análise
write_rds(bases_enzima, "data/data-set-analise-enzima.rds")

