#! /usr/bin/bash

mkdir "$(pwd)/raw"

for file in "$(pwd)"/download/**;
do
    if [[ $file = *.gz ]]
    then
        gunzip -c "$file" > "$(pwd)/raw/$(basename "$file" .gz)"
    elif [[ $file = *.tsv ]]
    then
        mv "$file" "$(pwd)"/raw
    fi
done

sed -i '1i\STITCH_Compound_ID\tATC' raw/drug_atc.tsv
sed -i '1i\STITCH_Compound_ID\tDrug_Name' raw/drug_names.tsv
sed -i '1i\STITCH_Compound_ID_flat\tUMLS_CUI\tDetection_Method\tUMLS_CUI_Concept_Name\tMedDra_Concept_Type\tUMLS_CUI_for_MedDRA_Term\tMedDRA_Concept_Name' raw/meddra_all_indications.tsv
sed -i '1i\Source_Label\tSTITCH_Compound_ID_flat\tSTITCH_Compound_ID_stereo\tUMLS_CUI\tDetection_Method\tUMLS_CUI_Concept_Name\tMedDra_Concept_Type\tUMLS_CUI_for_MedDRA_Term\tMedDRA_Concept_Name' raw/meddra_all_label_indications.tsv
sed -i '1i\Source_Label\tSTITCH_Compound_ID_flat\tSTITCH_Compound_ID_stereo\tUMLS_CUI\tMedDra_Concept_Type\tUMLS_CUI_for_MedDRA_Term\tMedDRA_Concept_Name' raw/meddra_all_label_se.tsv
sed -i '1i\STITCH_Compound_ID_flat\tSTITCH_Compound_ID_stereo\tUMLS_CUI\tMedDra_Concept_Type\tUMLS_CUI_for_MedDRA_Term\tMedDRA_Concept_Name' raw/meddra_all_se.tsv
sed -i '1i\STITCH_Compound_ID_flat\tSTITCH_Compound_ID_stereo\tUMLS_CUI\tplacebo\tfrequency_description\tfrequency_lower_bound\tfrequency_upper_bound\tMedDra_Concept_Type\tUMLS_CUI_for_MedDRA_Term\tMedDRA_Concept_Name' raw/meddra_freq.tsv
sed -i '1i\UMLS_CUI\tkind_of_term\tMedDra_ID\tSide_Effect' raw/meddra.tsv