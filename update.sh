#!/usr/bin/env bash

# update "user" "repo" "filename" "filter"
function update() {
  user=$1
  repo=$2
  filename=$3
  filter=$4

  url="https://api.github.com/repos/${user}/${repo}/releases"
  output="output/${user}-${repo}.json"
  curl -o "${output}" "$url"

  for asset in $(jq -c 'map(select(.prerelease == false)) | .[0] | .assets[]' "${output}"); do
    name=$(echo "$asset" | jq -r '.name')
    if [[ $name =~ $filter ]]; then
      version="${BASH_REMATCH[1]}"

      v=$(sed -n 's/.*version "\([^"]*\)".*/\1/p' $filename)
      if [ "$v" == "$version" ]; then
        echo "$filename no updates current version: $version"
      else
        sed -i "s/version \"$v\"/version \"$version\"/" "$filename"
        echo "$filename update version: from $v => $version"
      fi
    fi
  done
}

if [ ! -d "output" ]; then
    mkdir "output"
fi

for config in $(jq -c '.config[]' "config.json"); do
  name=$(echo "$config" | jq -r '.name')
  version=$(echo "$config" | jq -r '.version')

  repoUrl=$(sed -n 's/.*homepage "\([^"]*\)".*/\1/p' "$name")
  user=$(echo "$repoUrl" | sed -n 's|https://github.com/\([^/]*\)/\([^/]*\)|\1|p')
  repo=$(echo "$repoUrl" | sed -n 's|https://github.com/\([^/]*\)/\([^/]*\)|\2|p')

  update "$user" "$repo" "$name" "$version"
done

exit 0
