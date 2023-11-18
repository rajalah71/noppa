
# Noppa

Heitä k kertaa n-sivuista noppaa, esitä tulokset, laske niiden summa ja
sen todennäköisyys. Lisäksi funktio voi piirtää summan
pistetodennäköisyysfunktion.

``` r
library(noppa)
```

``` r
noppa(lkm, sivuja, plot, takaisinpalautus)
```

``` r
noppa(lkm = 1, sivuja = 6)
```

    ## Heitit: 4

``` r
noppa(2,6)
```

    ## Heitit: 6, 6
    ## Summa: 12 
    ## P(2d6 <= 12) = 1

``` r
noppa(2,6, plot = TRUE)
```

    ## Heitit: 6, 5
    ## Summa: 11 
    ## P(2d6 <= 11) = 0.972

![](README_files/figure-gfm/unnamed-chunk-5-1.png)<!-- -->

``` r
noppa(3,8, plot = TRUE)
```

    ## Heitit: 8, 5, 1
    ## Summa: 14 
    ## P(3d8 <= 14) = 0.594

![](README_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->
