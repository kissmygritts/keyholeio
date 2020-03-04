# keyholeio

<!-- badges: start -->
<!-- badges: end -->

The goal of keyholeio is to overcome some of the issues when reading `.kmz` and `.kml` files into R:

* `.kmz` files cannot be read into R with some installations of `sf`
* only the first layer of multi-layer `.kml` and `.kmz` are read into R

## Installation

``` r
install.packages('devtools')

devtools::install_github('kissmygritts', 'keyholeio')
```

## Example

There is only one function to use in `keyholeio`, `read_keyhole`. It will read `.kmz` and `.kml` files, even if they have multiple layers.

``` r
library(keyholeio)
library(mapview)
library(magrittr)

library(magrittr)

read_keyhole('data/routes.kml') %>%
  mapview()

read_keyhole('data/routes.kmz') %>%
  mapview()

read_keyhole('data/routes-multi.kml') %>%
  mapview()

read_keyhole('data/routes-multi.kmz') %>%
  mapview()

## throws an error
read_keyhole('routes-multi.km')
```

## Disclaimer

I didn't check to see if a solution existed before writing this package. I did this mostly to "scratch my own itch" and figure out how to publish an R package.
