#!/usr/bin/env bash

export SOURCE=./

mv -v ${SOURCE}README.md content/_index.md

gsed -i 's!{% hint style="info" %}!{{% notice note %}}!g' content/_index.md
gsed -i 's!{% endhint %}!{{% /notice %}}!g' content/_index.md

mv -v ${SOURCE}.gitbook/assets static/

for i in networking certificate ; do
  mv -v ${SOURCE}${i} content/
done;
mv -v ${SOURCE}certificate.md content/certificate/_index.en.md

find content -name README.md | while read line ; do
  mv -v $line $(dirname $line)/_index.en.md;
done;


find content -name '*.md' | while read filename ; do
  gsed -i -E 's!^# ([^#]*?)$!---\ntitle: \1\n---\n!' $filename
  gsed -i 's!\.gitbook!!g' $filename
  gsed -i 's!\.\./\.gitbook!!g' $filename
  gsed -i -E 's!\{\% embed url="([^"]+)" \%\}!\1!' $filename
done;

echo "ToDo:"
echo -e "\tUpdate _index.md... Title..."