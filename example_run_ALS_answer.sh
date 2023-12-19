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

nextflow run main.nf -profile fil_hpc -resume\
 -entry pop_assign_only\
 --study_name AnswerALS\
 --vcf_file /biodata/franco/datasets/answerALS/genomics/4_JointGenotyping/processed/AnswerALS.with_transcriptomics.complete.MAF_0.01.renamed_ids.vcf.gz\
 --outdir ./results_test_AnswerALS


# Runs normalisation of only RNAseq with a specific count matrix, instead of quant_results_path
# vcf_file is optional (can be skipped, but then qtlmap_inputs table will put "false" for vcf)
nextflow run main.nf -profile fil_hpc -resume \
  -entry norm_only \
  --study_name AnswerALS \
  --ge_exp_matrix_path /biodata/franco/datasets/answerALS/transcriptomics/4_matrix/AnswerALS-290-T-v1-release5_rna-counts-matrix.tsv.gz \
  --sample_meta_path /biodata/franco/datasets/answerALS/transcriptomics/sample_metadata_for_qcnorm.txt \
  --skip_exon_norm \
  --skip_tx_norm \
  --skip_txrev_norm \
  --skip_leafcutter_norm \
  --outdir results/answerALS_exp_matrix_norm_only

  # --vcf_file /gpfs/space/projects/eQTLCatalogue/test_data/GEUVADIS_GBR_cohort/vcf/GEUVADIS_GBR20.vcf.gz \
