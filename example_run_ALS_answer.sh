### Steps:
# - Should we try to reproduce phenotypes data, with gencode?
# - eqtl catalogue is done with ensembl105, but als answer was built with ensembl104
# - - It's mostly the same I'd say
# - I don't think there are many differences, could check which genes are affected and
#   if they are expressed

## NEED:
# Download ALS genotypes [DONE]
# Process 1kg vcf genotype into single vcf [DONE] got the original data
# make single vcf for ALS genotypes [DONE]
# Runs pop_assign workflow only

# "quant_results_path" works only if the previous "eQTLcatalogue/rnaseq" workflow was run because it searches for this path
# "${params.quant_results_path}/featureCounts/merged_gene_counts.tsv.gz"

### VERSION 5 ####

nextflow run main.nf -profile fil_hpc -resume\
 -entry pop_assign_only\
 --study_name AnswerALS\
 --vcf_file /biodata/franco/datasets/answerALS/genomics/4_JointGenotyping/processed/AnswerALS.with_transcriptomics.complete.MAF_0.01.renamed_ids.vcf.gz\
 --outdir ./results_AnswerALS_v5

# Runs normalisation of only RNAseq with a specific count matrix, instead of quant_results_path
# vcf_file is optional (can be skipped, but then qtlmap_inputs table will put "false" for vcf)
nextflow run main.nf -profile fil_hpc -resume \
  -entry norm_only \
  --study_name AnswerALS \
  --ge_exp_matrix_path /biodata/franco/datasets/answerALS/transcriptomics/4_matrix/AnswerALS-290-T-v1-release5_rna-counts-matrix.tsv.gz \
  --sample_meta_path /biodata/franco/datasets/answerALS/transcriptomics/sample_metadata_for_qcnorm_v5.txt \
  --skip_exon_norm \
  --skip_tx_norm \
  --skip_txrev_norm \
  --skip_leafcutter_norm \
  --outdir results/answerALS_exp_matrix_norm_only

  # --vcf_file /gpfs/space/projects/eQTLCatalogue/test_data/GEUVADIS_GBR_cohort/vcf/GEUVADIS_GBR20.vcf.gz \

### VERSION 6 ####
nextflow run main.nf -profile fil_hpc -resume\
 -entry pop_assign_only\
 --study_name AnswerALS\
 --vcf_file /biodata/franco/datasets/answerALS/genomics/4_JointGenotyping/processed_v6/AnswerALS.with_transcriptomics.complete.MAF_0.01.renamed_ids.vcf.gz\
 --outdir ./results_pop_AnswerALS_v6


nextflow run main.nf -profile fil_hpc -resume \
  -entry norm_only \
  --study_name AnswerALS \
  --ge_exp_matrix_path /biodata/franco/datasets/answerALS/transcriptomics/4_matrix/AnswerALS-651-T-v1-release6_rna-counts-matrix.tsv.gz \
  --sample_meta_path /biodata/franco/datasets/answerALS/transcriptomics/sample_metadata_for_qcnorm_v6.txt \
  --skip_exon_norm \
  --skip_tx_norm \
  --skip_txrev_norm \
  --skip_leafcutter_norm \
  --outdir results/answerALS_exp_matrix_norm_only_v6

  # --vcf_file /gpfs/space/projects/eQTLCatalogue/test_data/GEUVADIS_GBR_cohort/vcf/GEUVADIS_GBR20.vcf.gz \

### If you get error
#  Warning message:
#  Expected 2 pieces. Missing pieces filled with `NA` in 60664 rows [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...].
## Fix with:
# - It's something to do with the gene names, the column chosen is not the good one, or the "gene_id" column must be renamed to "phenotype_id"


##TODO 
# Runs QC workflow only
# (pop_assign have been run before and projections.tsv file is provided via pop_assign_projections parameter)
# (MBV folder under "quant_results_path" is expected to be there with MBV files inside)
# or with a specific path to gene_expression feature counts file
# you can skip the MBV files directory when you don't use "quant_results_path" and use "ge_exp_matrix_path"

# nextflow run main.nf -profile tartu_hpc -resume\
#  -entry qc_only\
#  --study_name LCL_multi\
#  --ge_exp_matrix_path /gpfs/space/home/kerimov/multistudy_nf/results/metadata_and_fc_merged/joined_feature_counts.tsv\
#  --pop_assign_projections /gpfs/space/home/kerimov/qcnorm/results_multi_LCL_noAMR/LCL_multi/pop_assign/projections_comb.tsv\
#  --sample_meta_path /gpfs/space/home/kerimov/multistudy_nf/results/metadata_and_fc_merged/merged_metadata.tsv\
#  --outdir ./results_multi_LCL_qc