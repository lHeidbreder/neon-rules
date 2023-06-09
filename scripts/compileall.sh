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
rm ${file_output_dir}/*

files=(${main_dir}/*/*.tex)

for i in ${files[@]}
do
    cd ${i%/*.tex}
    if [ -f prep.sh ]; 
    then bash prep.sh; fi
    echo "Compiling: ${i##*/}"
    for j in {1..4}
    do
        lualatex.exe -interaction=nonstopmode --output-directory="${file_output_dir}" ${i##*/} 1>> "${console_output_dir}/compile.out" 2>> "${console_output_dir}/compile.err"
    done
    cd $main_dir
done

#Delete all non-pdf files
rm ${file_output_dir}/*[!.pdf]
