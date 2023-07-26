# What is bcl2fastq?

The Illumina bcl2fastq2 Conversion Software demultiplexes sequencing data and converts base call (BCL) files into FASTQ files. For more information, please see the latest [software guide](https://support.illumina.com/content/dam/illumina-support/documents/documentation/software_documentation/bcl2fastq/bcl2fastq2-v2-20-software-guide-15051736-03.pdf).

This image is built based on Alpine Linux. It's very lightweight with only 36M in size.

The image uses bcl2fastq2 v2.20.0.422.

# How to build this image

Simply run the following command:

```bash
sudo make build
```

To make a clean build (build from scratch, not using any existinig cache), run the 
following command:
```bash
sudo make cleanbuild
```

The output of these commands are two images, one tagged as the 'latest' image, and the other with the docker version and the commit hash from which it was built (e.g. ```v2.20.0.422_25dd0c0```). The command also creates a zipped tarball, named with the repository and tag, the commit hash and the image ID. e.g. ```seglh-bcl2fastq2:v2.20.0.422_25dd0c0-192ab7b62701.tar.gz```.

The zipped tarball can be loaded as an image as follows:
```bash
sudo docker load --input $PATH_TO_ZIPPED_TAR
```

# How to use this image

Please use the following command to fetch the container log:
```bash
docker logs -f $container_name
```

## Demultiplex to the same run folder

```bash
docker run -rm -v $runfolder_dir:/mnt/run seglh/bcl2fastq2:$tag -R /mnt/run --no-lane-splitting
```
Replace `$runfolder_dir` with the real run folder directory on the host machine.

## Demultiplex to a different location

This is useful when FASTQ files need to be demultiplexed and stored separately e.g. in a NAS storage device.

```bash
docker run -rm -v $runfolder_dir:/mnt/run -v $output_dir:/mnt/output -v $samplesheet_path:/mnt/run/$samplesheet_name seglh/bcl2fastq2:$tag --R /mnt/run --output-dir /mnt/output --sample-sheet /mnt/run/$samplesheet_name --no-lane-splitting
```
Replace `$runfolder_dir` and `$output_dir` with the corresponding directories on the host machine,`$samplesheet_path` with the path to the samplesheet on the host machine, and `$samplesheet_name` with the name of the samplesheet. Replace `$tag` with the image tag (bcl2fastq2 version and commit hash).

# Push to dockerhub
```bash
sudo make push
```