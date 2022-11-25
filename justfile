# Set global variables
# export directory_path := "directory.json"

# List available commands
_default:
  just --choose --chooser "fzf +s -x --tac --cycle"

help:
	just --list

# Generate a json file with the list of all available actions
_create_directory:
	find . -type f \( -iname "*.yml" ! -path "*example*" \)  | xargs -I{} yq ea '[.]' {} | yq ea -o=j '{"directory": .}' > directory.json

generate_directory: _create_directory
	tera -t templates/directory.adoc.tera directory.json > doc/directory.adoc

# Generate the readme as .md
md: generate_directory
    #!/usr/bin/env bash
    asciidoctor -b docbook -a leveloffset=+1 -o - README_src.adoc | pandoc   --markdown-headings=atx --wrap=preserve -t markdown_strict -f docbook - > README.md
