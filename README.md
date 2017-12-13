# SIGSEP MUS STEMS Encoder/Decoder

## Setup

### Pull Docker Container

The easiest way to set up the encoder and decoder for the `MUS` dataset is to install [docker](http://docker.com) and pull our precompiled image from dockerhub:

```
docker pull faroit/sigsep-mus-io
```

Alternatively (and if you want to customize the build script) you can clone the repository and build the docker container from command line using:

```
docker build -t mus .
```

## Usage

### Decode SIGSEP MUS to WAV format

Unzip the MUS dataset to some location of your choice.  default is `./data/MUS/..`

#### Using Bash on Mac/Linux

If you have the dataset saved in a different location, change the volume mounts in the docker command:

```
docker run --rm -v $(pwd)/data/MUS:/data faroit/sigsep-mus-io /scripts/decode.sh
```

### Using Windows 10

In Windows Command Line (`cmd`) you can use the current directory variables (`%cd%`) to mount the data directories.

```
docker run --rm -v %cd%/data/MUS:/data faroit/sigsep-mus-io /scripts/decode.sh
```


### Encode SIGSEP MUS to STEMS format

To encode a MUS estimate or wav directory, you can use the `sh encode.sh` script.
Again, if you have saved the data directoy in a different location than the default folder, please change it

```
docker run --rm -v $(pwd)/data/ESTIMATE_DIR:/data faroit/sigsep-mus-io /mus/encode.sh
```
