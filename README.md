
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Projeto de Pesquisa - Efeito do ABA na maturação da cana-de-açúcar

Pizani, GA; Panosso, AR; Cardozo, NP; Silva, MA

## Carregando Pacotes

``` r
library(tidyverse)
```

## Carregando o Banco de dados

``` r
data_set <- read_rds("data/data-set-principal.rds")
```

## Início da validação dos dados

``` r
skimr::skim(data_set)
```

|                                                  |          |
|:-------------------------------------------------|:---------|
| Name                                             | data_set |
| Number of rows                                   | 384      |
| Number of columns                                | 10       |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |          |
| Column type frequency:                           |          |
| character                                        | 1        |
| numeric                                          | 8        |
| POSIXct                                          | 1        |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |          |
| Group variables                                  | None     |

Data summary

**Variable type: character**

| skim_variable | n_missing | complete_rate | min | max | empty | n_unique | whitespace |
|:--------------|----------:|--------------:|----:|----:|------:|---------:|-----------:|
| bloco         |         0 |             1 |   2 |   2 |     0 |        4 |          0 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate | mean | sd | p0 | p25 | p50 | p75 | p100 | hist |
|:---|---:|---:|---:|---:|---:|---:|---:|---:|---:|:---|
| faz | 0 | 1.00 | 97.50 | 48.56 | 49.00 | 49.00 | 97.50 | 146.00 | 146.00 | ▇▁▁▁▇ |
| trat | 0 | 1.00 | 4.50 | 2.29 | 1.00 | 2.75 | 4.50 | 6.25 | 8.00 | ▇▃▇▃▇ |
| peso | 0 | 1.00 | 17.07 | 2.27 | 11.65 | 15.46 | 17.10 | 18.72 | 23.19 | ▂▆▇▅▁ |
| media_peso | 0 | 1.00 | 17.07 | 2.27 | 11.65 | 15.46 | 17.10 | 18.72 | 23.19 | ▂▆▇▅▁ |
| altura | 64 | 0.83 | 3.11 | 0.31 | 2.06 | 2.88 | 3.10 | 3.31 | 3.80 | ▁▂▇▇▃ |
| altura_media | 0 | 1.00 | 3.03 | 0.34 | 2.06 | 2.78 | 3.02 | 3.27 | 3.80 | ▁▅▇▆▃ |
| e_n | 320 | 0.17 | 37.29 | 4.06 | 28.67 | 33.67 | 37.17 | 40.75 | 45.33 | ▂▇▆▆▃ |
| e_n_medio | 320 | 0.17 | 37.29 | 4.06 | 28.67 | 33.67 | 37.17 | 40.75 | 45.33 | ▂▇▆▆▃ |

**Variable type: POSIXct**

| skim_variable | n_missing | complete_rate | min | max | median | n_unique |
|:---|---:|---:|:---|:---|:---|---:|
| data | 0 | 1 | 2025-03-17 | 2025-05-26 | 2025-04-21 12:00:00 | 6 |
