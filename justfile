# Set global variables
# export directory_path := "directory.json"

# List available commands
_default:
  just --choose --chooser "fzf +s -x --tac --cycle"

help:
	just --list

# Generate a json file with the list of all available actions
_create_directory:
	find . -type f \( -iname "action.yml" ! -path "*example*" \)  | xargs -I{} yq ea '[.]' {} | yq ea -o=j '{"directory": .}' > directory.json

generate_directory: _create_directory
	tera -t templates/directory.adoc.tera directory.json > doc/directory.adoc

doc_actions:
  #!/usr/bin/env bash
  echo "" > doc/actions.adoc
  for action in `find . -type f \( -iname "action.yml" ! -path "*example*" \)`; do
    folder=$(dirname "$action")
    #file=$(basename "$action")
    tera -t templates/action.adoc.tera "$action" > "$folder/doc.adoc"
    echo "include::../$folder/doc.adoc[]" >> doc/actions.adoc
  done

# Generate the readme as .md
md: generate_directory doc_actions
  #!/usr/bin/env bash
  asciidoctor -b docbook -a leveloffset=+1 -o - README_src.adoc | pandoc   --markdown-headings=atx --wrap=preserve -t markdown_strict -f docbook - > README.md

# Push the changes to master to an alternate repo for testing
push_test:
  git push chevdor "$(git branch --show-current)":master -f
