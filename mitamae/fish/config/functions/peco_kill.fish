function peco_kill
  if set -q $argv
    ps aux | peco | read proc
  else
    ps aux | peco --query $argv | read proc
  end
  if test -n "$proc"
    set -l pid (echo $proc | awk '{print $2}')
    echo "kill pid: $pid. [$proc]"
    kill $pid
  end
  set -e proc
end