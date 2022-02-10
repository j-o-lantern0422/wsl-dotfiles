function fish_prompt
  powerline -error $status -jobs (jobs -p | wc -l) --shell bare --max-width 40 -hostname-only-if-ssh -priority root,cwd,host,ssh,perms,git-branch,git-status,hg,jobs,exit,cwd-path,user
end
