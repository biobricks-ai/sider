#! /usr/bin/bash

export localpath;
localpath=$(pwd)

export rawpath;
rawpath=$localpath/raw

mkdir "$localpath"/brick

for file in "$rawpath"/**;
do
    fname=$(basename "$file" .tsv)
    duckdb -c "copy (select * 
                from read_csv('$file', 
                              delim='\t', 
                              ignore_errors=true
                            )
                    ) 
                to '$localpath/brick/$fname.parquet' (format parquet)"
done