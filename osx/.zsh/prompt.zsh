function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\/git:\1/'
}

function git_prompt_info() {
  local ref=$(git symbolic-ref HEAD 2> /dev/null)
  local git_status="$(git status 2> /dev/null)"
  local pairname=$(git config --get user.initials)
  local gstatus=' '

  local master_pattern="^# On branch master"
  local remote_pattern="# Your branch is (.*) of"
  local diverge_pattern="# Your branch and (.*) have diverged"

  if [[ ${pairname} == 'bv' ]]; then
    pairname=''
  else
    pairname="($pairname)"
  fi


  # basics
  if [[ ! ${git_status} =~ "working directory clean" ]]; then
    gstatus="%{$fg[red]%}⚡ "
  fi 

  # dirty?
  if [[ ${git_status} =~ "Changes to be committed" ]]; then
    gstatus=" %{$fg[red]%}⚡"
  elif [[ ${git_status} =~ "use \"git add" ]]; then
    gstatus=" %{$fg[blue]%}⚡"
  fi

  # remote stuff
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${match[1]} == "ahead" ]]; then
      gstatus="$gstatus%{$fg[yellow]%}↑"
    else
      gstatus="$gstatus%{$fg[yellow]%}↓"
    fi
    if [[ ${git_status} =~ ${diverge_pattern} ]]; then
      gstatus="$gstatus%{$fg[yellow]%}↕"
    fi
  fi

  # merging considerations
  if [[ -f .git/MERGE_HEAD ]]; then
    if [[ ${git_status} =~ "unmerged" ]]; then
      gstatus="$gstatus %{$fg[red]%}(unmerged)%{$reset_color%}"
    else
      gstatus="$gstatus %{$fg[green]%}(merged)%{$reset_color%}"
    fi
  fi

  if [[ -n $ref ]]; then
    echo "\n%{$fg_bold[green]%}${ref#refs/heads/}%{$reset_color%}$gstatus $pairname"
  fi
}

function rvm_prompt_info() {
  local vruby=$(echo $BUNDLE_PATH | sed -e 's/^.*\///' -e 's/@.*$//')
  local vgemset=$(echo $BUNDLE_PATH | sed -e 's/^.*\///' -e 's/^[^@]*//')
  echo "[%{$reset_color$fg[cyan]%}$vruby%{$reset_color%}%{$fg[magenta]%}$vgemset%{$reset_color%}]"
}

export PS1='%{$fg[gray]%}%n@%m:%3~$(git_prompt_info)%{$bold_color$fg[green]%}\$%{$reset_color%} '
export RPS1='$(rvm_prompt_info)'
