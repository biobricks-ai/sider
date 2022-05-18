# This file downloads all data files from SIDER 
library(rvest)
library(purrr)
library(fs)

options(timeout=1800) # download timeout

fs::dir_create("cache")
outs <- fs::dir_create("cache/download") # Create directory to which the downloaded files will be written 
href <- rvest::read_html("http://sideeffects.embl.de/download") |> html_elements("a") |> html_attr("href") # retrieve files in SIDER database 
dataref <- keep(href,~ grepl("(*.tsv|*.tsv.gz|*.obo)$",.)) |>  map_chr(~ paste0("http://sideeffects.embl.de",.)) # URLs of files to be downloaded
files   <- fs::path_file(dataref) |> partial(fs::path,outs)() # output paths

fs::dir_ls("cache/download") |> fs::file_delete() # delete any files already present 
walk2(dataref, files, download.file)

