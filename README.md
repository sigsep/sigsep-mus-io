# SigSep STEMS Encoder/Decoder

## Usage

### Build Docker Container from command line

```
docker build -t mus .
```

### Decode SIGSEP MUS to WAV format

Unzip the MUS dataset. The default location is `data/MUS` inside this folder directory.

#### Using Bash on Mac/Linux

If you use the default location you can just run `sh decode.sh` to decode all stem files to waves.
If you have the dataset saved in a different location, change the volume mounts in the docker command:

```
docker run --rm -v $(pwd):/mus -v PATH_TO_MUS_DATASET:/data --entrypoint=/bin/bash mus /mus/decode.sh
```

### Using Windows 10

In Windows Command Line (`cmd`) you can use the current directory variables (`%cd%`) to mount the data directories.

```
docker run --rm -v %cd%:/mus -v %cd%/data/MUS:/data --entrypoint=/bin/bash mus /mus/decode.sh
```


### Encode SIGSEP MUS to STEMS format

```
sh encode.sh
```
