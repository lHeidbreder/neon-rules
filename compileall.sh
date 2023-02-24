shopt -s nullglob
shopt -s globstar
main_dir=$(pwd)

console_output_dir="${main_dir}/compiler_output"
mkdir -p $console_output_dir
rm ${console_output_dir}/compile.out
touch ${console_output_dir}/compile.out
rm ${console_output_dir}/compile.err
touch ${console_output_dir}/compile.err

file_output_dir="${main_dir}/file_output"
mkdir -p $file_output_dir
rm ${file_output_dir}/*

files=(*/*.tex)

for i in ${files[@]}
do
    cd ${i%/*.tex}
    echo "${i##*/}"
    lualatex.exe -synctex=1 -interaction=nonstopmode --output-directory="${file_output_dir}" ${i##*/} 1>> "${console_output_dir}/compile.out" 2>> "${console_output_dir}/compile.err"
    cd $main_dir
done
