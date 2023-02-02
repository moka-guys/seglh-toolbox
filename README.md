# BAM2BIGWIG

Simple docker image that converts BAM files to bigwig files.

## Tools and scripts
The toolbox contains standard bioinformatics tools (see `Dockerfile`) and a set of convenience scripts.

## Usage

Create a bigWig coverage map from bam file:
```
docker run -it --rm -v `pwd`:/work seglh/toolbox bam2bw alignments.bam
```
This will create `alignments.bam.bw`.
