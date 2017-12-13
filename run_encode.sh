docker run --rm -v $(pwd):/mus -v $(pwd)/data/MUS:/data --entrypoint=/bin/bash mus /mus/encode.sh -e MUS_DB="data/MUS/"
