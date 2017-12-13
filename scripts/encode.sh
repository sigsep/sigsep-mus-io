# MP4Box -version
cd "/data"

subsets=( "test" "train" )

for t in "${subsets[@]}"
do
  # encode to AAC
  cd $t;
  for dir in ./* ;do
    # iterate over track directories
    if [[ -d $dir ]];then
      echo $dir;
      cd "$dir";
      for i in *.wav;
        # get all stem filenames
        do name=`echo $i | cut -d'.' -f1`;
        # encode to AAC using Fraunhofer AAC encoding parameters
        ffmpeg \
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
      MP4Box -itags "cover=/mus/sigsep.png" -add mixture.mp4#ID=Z stem.mp4 \
             -add drums.mp4#ID=Z:disable \
             -add bass.mp4#ID=Z:disable \
             -add other.mp4#ID=Z:disable \
             -add vocals.mp4#ID=Z:disable
      mv stem.mp4 "../${dir}.stem.mp4"
      cd ..;
    fi
  done
  cd ..;
done
