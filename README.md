# seglh-toolbox
This repository should hold source code for third party tools that have been verified/validated for use.

Where possible the source code should be taken from official images and stored here.

Files should be named in a way to ensure the resulting docker images can be traced back to this dockerfile, eg by capturing the Image ID in the name of the saved docker archive and the directory name in the github repo.

Files should also be tagged with seglh/incase these tools are shared in the future.

## Git tags
Commits should be tagged to record versions of the dockerfile, eg if the dockerfile for bcftools_v1.15 dockerfile is changed, without affecting the version of bcftools deployed the tag can help distinguish which dockerfile was used for each of the docker images for that version of bcftools.