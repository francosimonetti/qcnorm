
nextflow run main.nf -profile fil_hpc -resume\
 -entry pop_assign_only\
 --study_name UCT_Malbran\
 --vcf_file /biodata/franco/agustin/annotated_vcfs/genotipado_conjunto_UCT_malbran_hg38_2024.biallelic_snps_indels.renamed_ids.vcf.gz\
 --outdir /biodata/franco/agustin/results_popassign_UCT_Malbran


nextflow run main.nf -profile fil_hpc -resume\
 -entry pop_assign_only\
 --study_name UCT_Malbran_OK\
 --vcf_file /biodata/franco/agustin/annotated_vcfs/genotipado_conjunto_UCT_malbran_hg38_2024_ok.biallelic_snps_indels.renamed_ids.vcf.gz\
 --outdir /biodata/franco/agustin/results_popassign_UCT_Malbran_OK



nextflow run main.nf -profile fil_hpc -resume\
 -entry pop_assign_only\
 --study_name MESA\
 --vcf_file /biodata/franco/datasets/mesa/downloads/genotype_merge/MESA_TOPMed_WGS_freeze.9b.ALL_CHR.biallelic_snps_indels.renamed_ids.vcf.gz\
 --outdir /biodata/franco/datasets/mesa/results_popassign_MESA