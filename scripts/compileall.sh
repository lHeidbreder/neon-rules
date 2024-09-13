#!/bin/bash
cut_absolute_path () {
  echo $(perl -le 'use File::Spec; print File::Spec->abs2rel(@ARGV)' $1 ${main_dir})
}

analyse_error () {
  NAME=$( echo $1 | sed 's/.tex$//g' )
  echo "! Error on ${NAME}" 1>&2
  if type texloganalyser > /dev/null; then
    RELATIVE=$(cut_absolute_path "${console_output_dir}/${NAME}.analyser.log")
    echo "! Writing log to ${RELATIVE}" 1>&2
    texloganalyser -w ${OUT}/${NAME}.log > ${console_output_dir}/${NAME}.analyser.log
  fi
  mv ${OUT}/${NAME}.log ${console_output_dir}/
}

workspace_clean () {
  git checkout .
  git clean -Xf
  git clean -xf
}

package () {
  cd ${file_output_dir}
  jar Mcf rulepackage.zip .
}


shopt -s nullglob
shopt -s globstar
main_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/.."

console_output_dir="${main_dir}/scripts/compiler_output"
mkdir -p $console_output_dir
rm ${console_output_dir}/compile.out
touch ${console_output_dir}/compile.out
rm ${console_output_dir}/compile.err
touch ${console_output_dir}/compile.err

file_output_dir="${main_dir}/_rulepackage"
mkdir -p $file_output_dir
mkdir -p $file_output_dir/addons
mkdir -p $file_output_dir/missions
find ${file_output_dir} -maxdepth 2 -type f -delete

files=(${main_dir}/*/*.tex)

for i in ${files[@]}
do
    cd ${i%/*.tex}
    if [ -f prep.sh ]; 
    then bash prep.sh; fi
    echo "Compiling: ${i##*/}"

    OUT="${file_output_dir}"
    if [[ ${i%/*.tex} =~ addon-[^/]*$ ]]; then
      OUT="${file_output_dir}/addons"
    elif [[ ${i%/*.tex} =~ missions$ ]]; then
      OUT="${file_output_dir}/missions"
    fi

    latexmk -f -pdflua -interaction=nonstopmode -output-directory="${OUT}" ${i##*/} 1>> "${console_output_dir}/compile.out" 2>> "${console_output_dir}/compile.err" || analyse_error ${i##*/}
    cd $main_dir
done

#Delete all non-pdf files
find ${file_output_dir} -maxdepth 2 -type f -not -name '*.pdf' -delete

#Create ship-ready package
package
