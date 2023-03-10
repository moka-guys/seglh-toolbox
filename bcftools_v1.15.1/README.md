# bcftools v1.15.1
This dockerfile contains bcftools v1.15.1.

example usages are:
```
sudo docker run -v `pwd`:/inputs bcftools:v1.15.1 stats inputs/NGS538A_08_136819_NA12878_U_WES91SKIN_Pan4940_S8_markdup_Haplotyper.vcf.gz > NGS538A_08_136819_NA12878_U_WES91SKIN_Pan4940_S8_markdup_Haplotyper.stats
```

## makefile
The docker image should be build using the makefile

` sudo make build`

This builds the dockerfile and also saves the image into a gzipped archive, named with the unique containerID for the recently made file