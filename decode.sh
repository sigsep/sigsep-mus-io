# MP4Box -version
cd "/data"

subsets=( "test" "train" )

for t in "${subsets[@]}"
do
  # encode to AAC
  cd $t;
  for stem in *.stem.mp4;
    do name=`echo $stem | cut -d'.' -f1`;
    echo "$stem";
    mkdir "$name";
    cd "$name";
    MP4Box -single 1 "../${stem}" -out mixture.mp4;
    ffmpeg -i mixture.mp4 mixture.wav
    MP4Box -single 2 "../${stem}" -out drums.mp4;
    ffmpeg -i drums.mp4 drums.wav
    MP4Box -single 3 "../${stem}" -out bass.mp4;
    ffmpeg -i bass.mp4 bass.wav
    MP4Box -single 4 "../${stem}" -out other.mp4;
    ffmpeg -i other.mp4 other.wav
    MP4Box -single 5 "../${stem}" -out vocals.mp4;
    ffmpeg -i vocals.mp4 vocals.wav
    cd ..;
  done
  cd ..;
done
