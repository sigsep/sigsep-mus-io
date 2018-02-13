# MP4Box -version
cd "/data"

subsets=( "test" "train" )

encode () {
  echo "$1";
  cd "$1";
  for i in *.wav;
    # get all stem filenames
    do name=`echo $i | awk -F".wav" '{$0=$1}1'`;
    # encode to AAC using Fraunhofer AAC encoding parameters
    ffmpeg \
      -ss 00:00:00.200 \
      -loglevel panic \
      -f s16le \
      -acodec pcm_s16le \
      -ar 44100 \
      -ac 2 \
      -i $name.wav \
      -acodec libfdk_aac \
      -ab 256000 \
      $name.mp4
  done
  # merge to mp4 stem using mp4box
  MP4Box -itags "cover=/scripts/sigsep.png" \
         -add mixture.mp4#ID=Z \
          stem.mp4 \
         -add drums.mp4#ID=Z:disable \
         -add bass.mp4#ID=Z:disable \
         -add other.mp4#ID=Z:disable \
         -add vocals.mp4#ID=Z:disable \
         -quiet

  mv stem.mp4 "../$1.stem.mp4";
  rm drums.mp4 bass.mp4 other.mp4 vocals.mp4 mixture.mp4;
  cd ..;
}

for t in "${subsets[@]}"
do
  # encode to AAC
  cd $t;
  for dir in ./* ;do
    # iterate over track directories
    if [[ -d $dir ]];then
      encode "$dir";
    fi
  done
  cd ..;
done
