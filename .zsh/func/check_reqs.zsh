function() check_reqs() {
  for line in $(cat ~/requirements.txt ); do
    which $line > /dev/null
    if [ $? -ne 0 ]; then
      echo no $line
    fi;
  done;
}
