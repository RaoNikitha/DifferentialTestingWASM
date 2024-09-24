;; Test a `br_table` with multiple index values, only some of which fall within the target range, expecting the WebAssembly implementation to validate each correctly while assessing if `Wizard Engine` resets the control top and unreachable states as per specification.

(assert_invalid
  (module
    (func $br_table-test (result i32)
      (i32.const 1)
      (i32.const 0)
      (block (result i32)
        (br_table 0 1 0 (return) (i32.const 2))
      )
    )
  )
  "type mismatch"
)