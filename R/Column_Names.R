# The current data files on SIDER do not come with column names. This script generates an intermediate file with column names that can be assigned to the download files. 
library(tools)
library(arrow)

options(timeout=1800) # download timeout

README_link = "http://sideeffects.embl.de/media/download/README" # Download the current README. This README was used to make the column names. 
README_output = "cache/README/README.txt" 
README_md5 = "58473455804d7d128b233cb18a42c86d" # This is the md5sum of the README that was used to manually write out the column names. If the README changes from what was used, then the new README needs to be examined to see if the column names are still correct

fs::dir_create("cache/README") # Create directory to which the downloaded files will be written 

download.file(url = README_link, destfile = README_output) # download the README file 

{
	if(md5sum(README_output) == README_md5) { # check if the md5sums match. If they do, then make a file for the column names.
		File_names <- c("drug_atc.parquet", "drug_names.parquet", "meddra_all_indications.parquet", 
			"meddra_all_label_indications.parquet", "meddra_all_label_se.parquet", 
			"meddra_all_se.parquet", "meddra_freq.parquet", "meddra.parquet")
		Column_Names <- c("STITCH_Compound_ID, ATC", "STITCH_Compound_ID, Drug_Name", 
			"STITCH_Compound_ID_flat, UMLS_CUI, Detection_Method, UMLS_CUI_Concept_Name, MedDra_Concept_Type, UMLS_CUI_for_MedDRA_Term, MedDRA_Concept_Name", 
			"Source_Label, STITCH_Compound_ID_flat, STITCH_Compound_ID_stereo, UMLS_CUI, Detection_Method, UMLS_CUI_Concept_Name, MedDra_Concept_Type, UMLS_CUI_for_MedDRA_Term, MedDRA_Concept_Name",
			"Source_Label, STITCH_Compound_ID_flat, STITCH_Compound_ID_stereo, UMLS_CUI, MedDra_Concept_Type, UMLS_CUI_for_MedDRA_Term, MedDRA_Concept_Name", 
			"STITCH_Compound_ID_flat, STITCH_Compound_ID_stereo, UMLS_CUI, MedDra_Concept_Type, UMLS_CUI_for_MedDRA_Term, MedDRA_Concept_Name", 
			"STITCH_Compound_ID_flat, STITCH_Compound_ID_stereo, UMLS_CUI, placebo, frequency_description, frequency_lower_bound, frequency_upper_bound, MedDra_Concept_Type, UMLS_CUI_for_MedDRA_Term, MedDRA_Concept_Name", 
			"UMLS_CUI, kind_of_term, MedDra_ID, Side_Effect")

		Column_Names = gsub(Column_Names, pattern = " ", replacement = "") # Remove spaces 
		Column_Names_Frame <- as.data.frame(cbind(File_names, Column_Names), stringsAsFactors=FALSE)
		write_parquet(Column_Names_Frame, "cache/README/Column_Names.parquet")
	}

	else { # if they do not match, print an error message and do not write the file.
		print("SIDER's README file has changed and the md5sum of the downloaded file does not match the expected md5sum. The Column_Names file has not been outputted. The column names need to be rechecked.")
	}
}
