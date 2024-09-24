;; **Test 4: br_table with mismatched operand lengths across modules** - Module A’s function contains `br_table` targeting modules with differing operand lengths. - Imported into Module B, call sequences cross boundaries correcting operand counts. - Check if `wizard_engine` raises `BrTableArityMismatch`, while WebAssembly runs with incorrect operand stacking.

(assert_invalid
  (module
    (func $moduleA_func
      (block (result i32)
        (br_table 0 0 (i32.const 1) (i32.const 2))
      )
    )
    (func (import "moduleB" "funcB") (result i32))
  )
  "type mismatch"
)