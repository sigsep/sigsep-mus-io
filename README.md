# SIGSEP MUS STEMS Encoder/Decoder

The purpose of this tool is to decode and encode the sigsep mus stems dataset. By providing a docker based installation setup, we can make sure that all users deal with the same decoded PCM data and therefore foster reproducible research.

## Setup

The easiest way to set up the encoder and decoder for the `MUS` dataset is to install [docker](http://docker.com).

### Pull Docker Container

Pull our precompiled `sigsep-mus-io` image from dockerhub:

```
docker pull faroit/sigsep-mus-io
```

_Alternatively (or if you want to customize the `Dockerfile`) you can clone the repository and build the docker container from command line using:_

```
docker build -t mus .
```

## Usage

### Decode SIGSEP MUS to WAV format

Unzip the MUS dataset to any location of your choice. Lets assume you have it unpacked in `~/data/MUS/`.

#### Using Bash on Mac/Linux

Run the decoding scripts with the following command below. Make sure to change the volume mounts `-v ABSOLUTE/PATH/TO/YOUR/MUS/FOLDER:/data` in the docker command.

```
docker run --rm -v $(~)/data/MUS:/data faroit/sigsep-mus-io /scripts/decode.sh
```

### Using Windows (10)

In Windows Command Line (`cmd`) you can use the directory variables to mount the data directories. Assuming that the data lies in the MUS subfolder of your home directory, you may use:

```
docker run --rm -v %HOMEDRIVE%"%HOMEPATH%/MUS":/data faroit/sigsep-mus-io /scripts/decode.sh
```


### Encode SIGSEP MUS to STEMS format

To encode a MUS estimates directory, you can use the `sh encode.sh` script.
Again, if you have saved the data directoy in a different location than the default folder, please change it

```
docker run --rm -v $(~)/data/ESTIMATE_DIR:/data faroit/sigsep-mus-io /scripts/encode.sh
```

## Manual Conversion

### Requirements

* FFMPEG 3.4
* MP4Box 7.1
* gnu-parallel

### Usage

Run the `decode.sh` or `encode.sh` scripts manually.
