#!/bin/bash

# update "user" "repo" "filename" "filter"
function update() {
  user=$1
  repo=$2
  filename=$3
  filter=$4

  url="https://api.github.com/repos/${user}/${repo}/releases"
  output="output/${user}-${repo}.json"
  curl -s -o "${output}" "$url"

  jq -c 'map(select(.prerelease == false)) | .[0] | .assets[]' "${output}" | while read -r asset; do
    name=$(echo "$asset" | jq -r '.browser_download_url')
    digest=$(echo "$asset" | jq -r ".digest")
    if [[ $name =~ $filter ]]; then
      version="${BASH_REMATCH[1]}"

      v=$(sed -n 's/.*version "\([^"]*\)".*/\1/p' "$filename")
      oldsha=$(sed -n 's/.*sha256 "\([^"]*\)".*/\1/p' "$filename")
      if [ "$v" == "$version" ]; then
        echo "$filename no updates current version: $version"
      else
        if [[ "$os" == "Darwin" ]]; then
          sed -i '' "s/version \"$v\"/version \"$version\"/" "$filename"
          if [[ -n "$digest" ]]; then
            checksum=$(echo "$asset" | jq -r ".digest | split(\":\") | .[1]")
            sed -i '' "s/sha256 \"$oldsha\"/sha256 \"$checksum\"/" "$filename"
          fi
        else
          sed -i "s/version \"$v\"/version \"$version\"/" "$filename"
          if [[ -n "$digest" ]]; then
            checksum=$(echo "$asset" | jq -r ".digest | split(\":\") | .[1]")
            sed -i "s/sha256 \"$oldsha\"/sha256 \"$checksum\"/" "$filename"
          fi
        fi
        echo "true" > output/status.txt
        echo "$filename update $repo from $v to $version" >> output/message.txt
        echo "$filename update $repo from $v to $version"
      fi
    fi
  done
}

function updateGitlab() {
  domain=$1
  user=$2
  repo=$3
  filename=$4

  url="https://$domain/api/v4/projects/$user%2F$repo/releases"
  version=$(curl -s "$url" | jq -r '[.[] | select(.tag_name | test("beta|alpha|rc"; "i") | not)][0].tag_name')

  v=$(sed -n 's/.*version "\([^"]*\)".*/\1/p' "$filename")
  if [ "$v" == "$version" ]; then
    echo "$filename no updates current version: $version"
  else
    if [[ "$os" == "Darwin" ]]; then
      sed -i '' "s/version \"$v\"/version \"$version\"/" "$filename"
    else
      sed -i "s/version \"$v\"/version \"$version\"/" "$filename"
    fi
    echo "true" > output/status.txt
    echo "$filename update $repo from $v to $version" >> output/message.txt
    echo "$filename update $repo from $v to $version"
  fi
}

function updateForgejo() {
  domain=$1
  user=$2
  repo=$3
  filename=$4

  url="https://$domain/api/v1/repos/$user/$repo/releases"
  version=$(curl -s "$url" | jq -r '[.[] | select(.tag_name | test("beta|alpha|rc"; "i") | not)][0].tag_name')

  v=$(sed -n 's/.*version "\([^"]*\)".*/\1/p' "$filename")
  if [ "$v" == "$version" ]; then
    echo "$filename no updates current version: $version"
  else
    if [[ "$os" == "Darwin" ]]; then
      sed -i '' "s/version \"$v\"/version \"$version\"/" "$filename"
    else
      sed -i "s/version \"$v\"/version \"$version\"/" "$filename"
    fi
    echo "true" > output/status.txt
    echo "$filename update $repo from $v to $version" >> output/message.txt
    echo "$filename update $repo from $v to $version"
  fi
}

if [ ! -d "output" ]; then
    mkdir "output"
fi

os=$(uname -s)

for config in $(jq -c '.config[]' "config.json"); do
  name=$(echo "$config" | jq -r '.name')
  version=$(echo "$config" | jq -r '.version')
  autoUpdate=$(echo "$config" | jq -r '.autoUpdate')
  type=$(echo "$config" | jq -r '.type')
  if [ "$autoUpdate" == "false" ]; then
      echo "$name disable auto update"
      continue
  fi

  repoUrl=$(sed -n 's/.*homepage "\([^"]*\)".*/\1/p' "$name")
  if [[ "$repoUrl" == https://github.com* ]]; then
    user=$(echo "$repoUrl" | sed -n 's|https://github.com/\([^/]*\)/\([^/]*\)|\1|p')
    repo=$(echo "$repoUrl" | sed -n 's|https://github.com/\([^/]*\)/\([^/]*\)|\2|p')
    update "$user" "$repo" "$name" "$version"
  elif [[ "$type" == "gitlab" ]]; then
    user=$(echo "$repoUrl" | sed -n 's|https://[^/]*/\([^/]*\)/\([^/]*\)|\1|p')
    repo=$(echo "$repoUrl" | sed -n 's|https://[^/]*/\([^/]*\)/\([^/]*\)|\2|p')
    domain=$(echo "$repoUrl" | sed -n 's|https://\([^/]*\)/\([^/]*\)/\([^/]*\)|\1|p')
    updateGitlab "$domain" "$user" "$repo" "$name"
  elif [[ "$type" == "forgejo" ]]; then
    user=$(echo "$repoUrl" | sed -n 's|https://[^/]*/\([^/]*\)/\([^/]*\)|\1|p')
    repo=$(echo "$repoUrl" | sed -n 's|https://[^/]*/\([^/]*\)/\([^/]*\)|\2|p')
    domain=$(echo "$repoUrl" | sed -n 's|https://\([^/]*\)/\([^/]*\)/\([^/]*\)|\1|p')
    updateForgejo "$domain" "$user" "$repo" "$name"
  fi
done
