nextflow run main.nf -profile fil_hpc -resume\
 -entry pop_assign_only\
 --study_name Calafate_merged\
 --vcf_file /biodata/franco/datasets/calafate/vcf/bgz/PASS/filter_chr/renamed_ids/merged.vcf.gz\
 --outdir /biodata/franco/transcriptomics/qcnorm/results_popassign_Calafate

nextflow run main.nf -profile fil_hpc -resume\
 -entry pop_assign_only\
 --study_name Calafate_merged\
 --vcf_file /biodata/franco/datasets/calafate/jointcall_vcf/filter_chr/renamed_ids/Genoma1X_250708_Calafate_DragengvcfJoint.hard-filtered.PASS.ref.Q30.vcf.gz\
 --outdir /biodata/franco/transcriptomics/qcnorm/results_popassign_Calafate_Joint

nextflow run main.nf -profile fil_hpc -resume\
 -entry pop_assign_only\
 --study_name Calafate_merged\
 --vcf_file /biodata/franco/datasets/calafate/gvcf/annotated_vcfs/reannotated_vcfs/Genoma1X_250708_Calafate_DragengvcfJoint.hard-filtered.biallelic_snps_indels.updated.renamed_ids.somatic_chrs.vcf.gz\
 --outdir /biodata/franco/transcriptomics/qcnorm/results_popassign_Calafate_Joint_refiltered