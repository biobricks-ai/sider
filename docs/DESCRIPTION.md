# Data overview 
- This directory contains data obtained from SIDER. SIDER is a resource that contains information on drugs and their recorded adverse drug effects. 
- The data is stored in parquet format. Descriptions for each column of each file in SIDER can be found below.
- The data was downloaded from: http://sideeffects.embl.de/download/

# Data Table List 
- `drug_atc.parquet`
- `drug_names.parquet`
- `meddra_all_indications.parquet`
- `meddra_all_label_indications.parquet`
- `meddra_all_label_se.parquet`
- `meddra_all_se.parquet`
- `meddra_freq.parquet`
- `meddra.parquet`

# Description of Files 

### Data files with drug names and ID numbers
`drug_atc.parquet`
- STITCH_Compound_ID. This column contains the [STITCH](http://stitch.embl.de/) Compound ID.
- ATC. This column contains the ATC (Anatomical Therapeutic Chemical code). Each drug is assigned a unique ATC code. This system is maintained by the [World Health Organization](https://www.whocc.no/).

`drug_names.parquet`
- STITCH_Compound_ID. This column contains the [STITCH](http://stitch.embl.de/) Compound ID.
- Drug_Name. This column contains the actual name of the drug as retrieved by SIDER.

### Data files with side effect information
`meddra_all_indications.parquet`
- STITCH_Compound ID_flat. This column contains the flat [STITCH](http://stitch.embl.de/) Compound ID.
- UMLS_CUI. This column contains the Unified Medical Language System (UMLS) Concept Unique Indentifier (CUI) number as it was found on the drug label. Each CUI in the UMLS corresponds to a specific medical [concept](https://www.nlm.nih.gov/research/umls/new_users/online_learning/Meta_005.html).
- Detection_Method. This column contains the method of detection. This is the method by which SIDER determined side effect information.
- UMLS_CUI_Concept_Name. Concept name corresponding to the UMLS CUI.
- MedDra_Concept_Type. This column contains the MedDRA concept type (LLT = lowest level term, PT = preferred term; in a few cases the term is neither LLT nor PT)
- UMLS_CUI_for_MedDRA_Term. This column contains the Unified Medical Language System (UMLS) Concept Unique Indentifier (CUI) for the MedDRA term.
- MedDRA_Concept_Name. This column contains the MedDRA concept name.

`meddra_all_label_indications.parquet`
- Source_Label. This column contains the source label used to construct the entry.
- STITCH_Compound_ID_flat. This column contains the [STITCH](http://stitch.embl.de/) Compound ID (flat)
- STITCH_Compound_ID_stereo. This column contains the [STITCH](http://stitch.embl.de/) Compound ID (stereo)
- UMLS_CUI. This column contains the [UMLS CUI](https://www.nlm.nih.gov/research/umls/new_users/online_learning/Meta_005.html).
- Detection_Method. This column contains the mthod of detection. This is the method by which SIDER determined side effect information.
- UMLS_CUI_Concept_Name. This column contains the concept name corresponding to the UMLS CUI.
- MedDra_Concept_Type. This column contains the MedDRA concept type (LLT = lowest level term, PT = preferred term; in a few cases the term is neither LLT nor PT)
- UMLS_CUI_for_MedDRA_Term. This column contains the UMLS concept ID for MedDRA term
- MedDRA_Concept_Name. This column contains the MedDRA concept name.

`meddra_all_label_se.parquet`
- Source_Label. This column contains the source label used to construct the entry.
- STITCH_Compound_ID_flat. This column contains the [STITCH](http://stitch.embl.de/) Compound ID (flat)
- STITCH_Compound_ID_stereo. This column contains the [STITCH](http://stitch.embl.de/) Compound ID (stereo)
- UMLS_CUI. This column contains the [UMLS CUI](https://www.nlm.nih.gov/research/umls/new_users/online_learning/Meta_005.html).
- MedDra_Concept_Type. This column contains the MedDRA concept type (LLT = lowest level term, PT = preferred term; in a few cases the term is neither LLT nor PT)
- UMLS_CUI_for_MedDRA_Term. This column contains the UMLS concept ID for MedDRA term
- MedDRA_Concept_Name. This column contains the MedDRA concept name.

`meddra_all_se.parquet`
- STITCH_Compound_ID_flat. This column contains the [STITCH](http://stitch.embl.de/) Compound ID (flat)
- STITCH_Compound_ID_stereo. This column contains the [STITCH](http://stitch.embl.de/) Compound ID (stereo)
- UMLS_CUI. This column contains the [UMLS CUI](https://www.nlm.nih.gov/research/umls/new_users/online_learning/Meta_005.html).
- MedDra_Concept_Type. This column contains the MedDRA concept type (LLT = lowest level term, PT = preferred term; in a few cases the term is neither LLT nor PT)
- UMLS_CUI_for_MedDRA_Term. This column contains the UMLS concept ID for MedDRA term
- MedDRA_Concept_Name. This column contains the MedDRA concept name.

`meddra_freq.parquet`
- STITCH_Compound_ID_flat. This column contains the [STITCH](http://stitch.embl.de/) Compound ID (flat)
- STITCH_Compound_ID_stereo. This column contains the [STITCH](http://stitch.embl.de/) Compound ID (stereo)
- UMLS_CUI. This column contains the [UMLS CUI](https://www.nlm.nih.gov/research/umls/new_users/online_learning/Meta_005.html).
- placebo. This column contains "placebo" if the info comes from placebo administration, "" otherwise
- frequency_description. A description of the frequency. For example "postmarketing", "rare", "infrequent", "frequent", "common", or an exact percentage
- frequency_lower_bound. This column contains the lower bound of the frequency
- frequency_upper_bound. This column contains the upper bound of the frequency
- MedDra_Concept_Type. This column contains the MedDRA concept type (LLT = lowest level term, PT = preferred term; in a few cases the term is neither LLT nor PT)
- UMLS_CUI_for_MedDRA_Term. This column contains the UMLS concept ID for MedDRA term
- MedDRA_Concept_Name. This column contains the MedDRA concept name.

`meddra.parquet`
- UMLS_CUI. This column contains the [UMLS CUI](https://www.nlm.nih.gov/research/umls/new_users/online_learning/Meta_005.html).
- kind_of_term. This column contains the kind of term (from MedDRA e.g. PT = preferred term)
- MedDra_ID. This column contains the MedDRA ID for the medical terminology
- Side_Effect. This column contains the name of the side effect.