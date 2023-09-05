# for profiling
# zmodload zsh/zprof
for f in ~/.zsh/setup/*.zsh; do
  [ -f $f ] && source $f
done

for f in ~/.zsh/*.zsh; do
  [ -f $f ] && source $f
done

for f in ~/.zsh/func/*.zsh; do
  [ -f $f ] && source $f
done

source ~/.zsh/private.zsh
# zprof
