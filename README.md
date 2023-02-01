# BAM2BIGWIG

Simple docker image that converts BAM files to bigwig files.

## Usage

docker run -t --rm \
-v /path/to/output:/output \
-v /path/to/input:/input \
seglh/bam2bigwig:latest
