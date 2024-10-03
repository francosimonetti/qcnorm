import pandas as pd 
import os

path="/biodata/franco/datasets/answerALS/transcriptomics/4_matrix"

df = pd.read_csv(os.path.join(path, "AnswerALS-651-T-v1-release6_raw-counts.csv"))
if "Geneid" in df.columns:
    df = df.rename(columns={"Geneid" : "phenotype_id"})    
else:
    df = df.rename(columns={df.columns[0] : "phenotype_id"})

samples = pd.read_table(os.path.join(path, "../sample_metadata_for_qcnorm_v6.txt"))
select = ["phenotype_id"] + list(samples["sample_id"])

df[select].to_csv(os.path.join(path, "AnswerALS-651-T-v1-release6_rna-counts-matrix.tsv.gz"), sep="\t", index=False)