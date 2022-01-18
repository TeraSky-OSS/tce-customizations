# Set input flags
declare -A arguments=();  
declare -A variables=();
declare -i index=1;
variables["-p"]="package_name";  
variables["--package-name"]="package_name";  
variables["-v"]="package_version";  
variables["--package-version"]="package_version";  
variables["-f"]="values_file";  
variables["--values-file"]="values_file";  
variables["-n"]="namespace";
variables["--namespace"]="namespace";
variables["-h"]="help";
variables["--help"]="help";
for i in "$@"  
do  
  arguments[$index]=$i;
  prev_index="$(expr $index - 1)";
  if [[ $i == *"="* ]]
    then argument_label=${i%=*} 
    else argument_label=${arguments[$prev_index]}
  fi
  if [[ $i == "--help" ]]; then
    # print Help Menu and exit
    cat << EOF
Usage: get-package-default-values.sh [OPTIONS]

Options:

[Mandatory Flags]
  -p / --package-name : The Tanzu Package Name
  -v / --package-version : The Tanzu Package Version
  -f / --values-file : The File name to save the values yaml in.

[Optional Flags]
  -n / --namespace : The namespace the package is in
EOF
    exit 1
  else
    if [[ -n $argument_label ]] ; then
      if [[ -n ${variables[$argument_label]} ]]
        then
            if [[ $i == *"="* ]]
                then declare ${variables[$argument_label]}=${i#$argument_label=}
              else declare ${variables[$argument_label]}=${arguments[$index]}
            fi
      fi
    fi
  fi
  index=index+1;
done;
# Validate Mandatory Flags were supplied
if ! [[ $package_name || $package_version || $values_file ]]; then
  echo "Mandatory flags were not passed. use --help for usage information"
  exit 1
fi

# Actual Script
touch $values_file
if [[ $namespace ]]; then
  tanzu package available get $package_name/$package_version -n $namespace --values-schema -o json | jq .[] | jq '"\(.key) === \"\(.default)\""' -r | sed 's/<nil>//g' - | sed 's/ === / --value /g' - | sed 's/^/yaml-set -g /g' - | sed "s/$/ $values_file/g" - | bash 2>/dev/null
else
  tanzu package available get $package_name/$package_version --values-schema -o json | jq .[] | jq '"\(.key) === \"\(.default)\""' -r | sed 's/<nil>//g' - | sed 's/ === / --value /g' - | sed 's/^/yaml-set -g /g' - | sed "s/$/ $values_file/g" - | bash 2>/dev/null
fi
