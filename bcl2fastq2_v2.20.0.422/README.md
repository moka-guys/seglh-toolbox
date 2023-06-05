# What is bcl2fastq?

The Illumina bcl2fastq2 Conversion Software demultiplexes sequencing data and converts base call (BCL) files into FASTQ files. For more information, please see the latest [software guide](https://support.illumina.com/content/dam/illumina-support/documents/documentation/software_documentation/bcl2fastq/bcl2fastq2-v2-20-software-guide-15051736-03.pdf).

This image is built based on Alpine Linux. It's very lightweight with only 36M in size.

# How to build this image

Simply run the following command:

```bash
$ sudo make build
```

# How to use this image

In the following examples, the `-d` option of the `docker run` command will run container in background. Please use `docker logs -f <container name>` to fetch the container log.

## Demultiplex to the same run folder

```bash
$ docker run -rm -v <runfolder-dir>:/mnt/run seglh/bcl2fastq2:<tag> --runfolder-dir /mnt/run --no-lane-splitting
```
Replace `<runfolder-dir>` with the real run folder directory on the host machine.

## Demultiplex to a different location

This is useful when FASTQ files need to be demultiplexed and stored separately e.g. in a NAS storage device.

```bash
$ docker run -rm -v <runfolder-dir>:/mnt/run -v <output-dir>:/mnt/output seglh/bcl2fastq2:<tag> --runfolder-dir /mnt/run --output-dir /mnt/output --sample-sheet <sample-sheet> --no-lane-splitting
```
Replace `<runfolder-dir>` and `<output-dir>` with the corresponding directories on the host machine, and `<sample-sheet>` with the path to the samplesheet. Replace `<tag>` with the image tag (bcl2fastq2 version and commit hash).
