#! /usr/bin/bash

export localpath;
localpath=$(pwd)

export rawpath;
rawpath=$localpath/raw

mkdir "$localpath"/brick

for file in "$localpath"/download/**;
do
    (( fname ))
    if [[ $file = *.gz ]]
    then
        fname=$(basename "$file" .tsv.gz)
    elif [[ $file = *.tsv ]]
    then
        fname=$(basename "$file" .tsv)
    fi
    duckdb -c "copy (select * 
                from read_csv('$file', 
                              delim='\t', 
                              ignore_errors=true,
                              header=false
                            )
                    ) 
                to '$localpath/brick/$fname.parquet' (format parquet)"
done