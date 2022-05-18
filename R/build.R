library(purrr)
library(vroom)
library(arrow)
library(stringr)

outdir <- fs::dir_create("data")

get_sider_column_names <- function(path, column_names) {
	unlist(strsplit(column_names$Column_Names[which(column_names$File_names == path)], ","))
}

save_parquet <- function(file, column_names) {
  path <- fs::path_ext_remove(file) |> fs::path_ext_set("parquet") |> fs::path_file()
  df   <- vroom::vroom(file,comment="#", delim="\t",
  			col_names = get_sider_column_names(path, column_names))
  arrow::write_parquet(df,fs::path(outdir,path))
}

# WRITE OUTS ================================================================================
fs::dir_ls(outdir)                             |> fs::file_delete() # delete files present in the directory
column_names <- read_parquet("cache/README/Column_Names.parquet", delim = "\t")
fs::dir_ls("cache/download",regexp="*.tsv") |> walk(save_parquet, column_names) 
