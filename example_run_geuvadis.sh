# Runs pop_assign workflow only
nextflow run main.nf -profile fil_hpc -resume\
 -entry pop_assign_only\
 --study_name GEUVADIS\
 --vcf_file /biodata/franco/datasets/geuvadis/genotypes/latest_from1000G_high_coverage/GEUVADIS_1kGP_high_coverage.complete.MAF_0.01.vcf.gz\
 --outdir ./results_GEUVADIS

# Runs QC workflow only
# (pop_assign have been run before and projections.tsv file is provided via pop_assign_projections parameter)
# (MBV folder under "quant_results_path" is expected to be there with MBV files inside)
nextflow run main.nf -profile fil_hpc -resume\
 -entry qc_only\
 --study_name GEUVADIS\
 --quant_results_path /biodata/franco/datasets/geuvadis/reprocess/fsimonetti-nfdata-aws/FULL\
 --pop_assign_projections ./results_GEUVADIS/GEUVADIS/pop_assign/projections_comb.tsv\
 --sample_meta_path /biodata/franco/datasets/geuvadis/GEUVADIS_sample_metadata_for_qcnorm.txt\
 --outdir ./results_GEUVADIS


#Runs norm workflow
nextflow run main.nf -profile fil_hpc -resume\
 -entry norm_only\
 --study_name GEUVADIS\
 --quant_results_path /biodata/franco/datasets/geuvadis/reprocess/fsimonetti-nfdata-aws/FULL\
 --sample_meta_path /biodata/franco/datasets/geuvadis/GEUVADIS_sample_metadata_for_qcnorm.txt\
 --skip_leafcutter_norm\
 --skip_exon_norm \
 --skip_tx_norm \
 --skip_txrev_norm \
 --outdir ./results_GEUVADIS