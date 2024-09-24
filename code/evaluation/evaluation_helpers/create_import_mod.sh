#!/bin/bash

TESTDIR=../../data/all_generated_tests/no_assert_str_wast_tests
OUTDIR=../../data/all_generated_tests/WITH_IMPORTS_no_assert_str_wast_tests
INFILE=fname_imports.txt

# Find the tests that have imports in them:
grep -l -r "(import \"" $TESTDIR/*.wast > $INFILE

while read -r LINE
do
    echo "Generating import for file: $LINE.wast"
    imp_decl=$(grep "(import \"" $TESTDIR/$LINE.wast)
    echo "   found imp_decl=$imp_decl"

    mod_name=$(echo $imp_decl | awk -F' ' '{print $2}')
    echo "    found mod_name=$mod_name"
    func_name=$(echo $imp_decl | awk -F' ' '{print $3}')
    echo "    found func_name=$func_name"
    params=$(echo "$imp_decl" | grep -E -o "\(param ([a-zA-Z]|[0-9]| )*\)")
    echo "    found params=$params"
    results=$(echo "$imp_decl" | grep -E -o "\(result ([a-zA-Z]|[0-9]| )*\)")
    echo "    found results=$results"

    echo "(module (func (export $func_name) $params $results" | tee -a $OUTDIR/$LINE.wast

    # handle result 0
    res0=$(echo "$results" | awk -F' ' '{print $2}')
    if [[ $res0 =~ "i32" ]]; then
        echo "i32.const 0" | tee -a $OUTDIR/$LINE.wast
    elif [[ $res0 =~ "i64" ]]; then
        echo "i64.const 0" | tee -a $OUTDIR/$LINE.wast
    elif [[ $res0 =~ "f32" ]]; then
        echo "f32.const 0" | tee -a $OUTDIR/$LINE.wast
    elif [[ $res0 =~ "f64" ]]; then
        echo "f64.const 0" | tee -a $OUTDIR/$LINE.wast
    fi

    # handle result 1
    res1=$(echo "$results" | awk -F' ' '{print $3}')
    if [[ $res1 =~ "i32" ]]; then
        echo "i32.const 0" | tee -a $OUTDIR/$LINE.wast
    elif [[ $res1 =~ "i64" ]]; then
        echo "i64.const 0" | tee -a $OUTDIR/$LINE.wast
    elif [[ $res1 =~ "f32" ]]; then
        echo "f32.const 0" | tee -a $OUTDIR/$LINE.wast
    elif [[ $res1 =~ "f64" ]]; then
        echo "f64.const 0" | tee -a $OUTDIR/$LINE.wast
    fi
    echo "))" | tee -a $OUTDIR/$LINE.wast # close the function and module
    echo "(register $mod_name)" | tee -a $OUTDIR/$LINE.wast
    echo | tee -a $OUTDIR/$LINE.wast

    cat $TESTDIR/$LINE.wast >> $OUTDIR/$LINE.wast
    echo >> $OUTDIR/$LINE.wast
done < "$INFILE"
