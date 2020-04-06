#!/usr/bin/env bash
echo "Remove/repace gitbook stuff in:"
find content -name '*.md' | while read filename ; do
  echo " - $filename"
  gsed -i -E 's!^# ([^#]*?)$!---\ntitle: \1\n---\n!' $filename
  gsed -i 's!\.gitbook!!g' $filename
  gsed -i 's!\.\./\.gitbook!!g' $filename
  gsed -i -E 's!\{\% embed url="([^"]+)" \%\}!\1!' $filename
  gsed -i -E 's!\{\% code title="([^"]+)" \%\}!`\1`!' $filename
  gsed -i -E 's!\{\% tab title="([^"]+)" \%\}!`\1`!' $filename
  gsed -i -E 's!\{\% tabs \%\}!!' $filename
  gsed -i -E 's!\{\% endcode \%\}!!' $filename
  gsed -i -E 's!\{\% endtab \%\}!!' $filename
  gsed -i -E 's!\{\% endtabs \%\}!!' $filename
  gsed -i 's!{% hint style="info" %}!{{% notice note %}}!g' $filename
  gsed -i 's!{% hint style="warning" %}!{{% notice info %}}!g' $filename
  gsed -i 's!{% hint style="danger" %}!{{% notice warning %}}!g' $filename
  gsed -i 's!{% endhint %}!{{% /notice %}}!g' $filename
done;
