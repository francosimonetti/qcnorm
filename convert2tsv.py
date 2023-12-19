import pandas as pd 
import os

path="/biodata/franco/datasets/answerALS/transcriptomics/4_matrix"

df = pd.read_csv(os.path.join(path, "AnswerALS-290-T-v1-release5_rna-counts-matrix.csv"))
df = df.rename(columns={df.columns[0] : "phenotype_id"})

samples = pd.read_table(os.path.join(path, "../sample_metadata_for_qcnorm.txt"))
select = ["phenotype_id"] + list(samples["sample_id"])

df[select].to_csv(os.path.join(path, "AnswerALS-290-T-v1-release5_rna-counts-matrix.tsv.gz"), sep="\t", index=False)