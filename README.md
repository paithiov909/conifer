# conifer <a href='https://paithiov909.github.io/conifer'><img src='https://rawcdn.githack.com/paithiov909/conifer/00f193f38dcefbcf7ab8a377fce7df493cd59a76/man/figures/logo.png' align="right" height="139" /></a>

[![GitHub last commit](https://img.shields.io/github/last-commit/paithiov909/conifer)](#)
[![GitHub license](https://img.shields.io/github/license/paithiov909/conifer.svg)](https://github.com/paithiov909/conifer/blob/main/LICENSE)

> R client of [COTOHA API](https://api.ce-cotoha.com/contents/index.html) for Developers (unofficial)

## Installation

```r
remotes::install_github("paithiov909/conifer")
```

## Usage of COTOHA API client

### Getting ready to use client

First of all, you should set `COTOHA_ID` and `COTOHA_SECRET` as environment vars.
Run `Sys.setenv(COTOHA_ID = "Your Client ID")` and `Sys.setenv(COTOHA_SECRET = "Your Client secret")`, then try snippets below.

```r
token <- conifer::getAccessToken("Access Token Publish URL comes here.")
client <- conifer::cotoha(token)
```

### Calling API

See the [reference](https://paithiov909.github.io/conifer/reference/index.html) for more info.

```r
client$keyword("翔んで埼玉 お前はまだグンマを知らない")
#> [[1]]
#> [[1]]$form
#> [1] "お前"
#> 
#> [[1]]$score
#> [1] 22.838
#> 
#> 
#> [[2]]
#> [[2]]$form
#> [1] "グンマ"
#> 
#> [[2]]$score
#> [1] 13.0929
```

## Related Products

- [ocean-v/rcotoha: rcotoha: R for COTOHA API](https://github.com/ocean-v/rcotoha)

## License

MIT license.

Icons made by [bqlqn](https://www.flaticon.com/free-icon/tree_2405113?term=tree-leaf&page=3&position=53) from [www.flaticon.com](https://www.flaticon.com/).
