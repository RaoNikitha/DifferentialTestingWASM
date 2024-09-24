;; 1. **Out of Bounds Branch Index with Imported Function Call:**    - Test involves a call to an imported function followed by a `br_table` with an operand that is out of bounds, targeting a default label within the same module.    - **Constraint Checked:** Ensures the operand stack and control flow are managed correctly across module boundaries.    - **Reasoning:** Examines if the `br_table` can correctly revert to a local default label without causing stack corruption after returning from the imported function.

(assert_invalid
  (module
    (func $imported (import "env" "external_func") (param i32))
    (func $test
      (call $imported (i32.const 42))
      (block (result i32)
        (i32.const 1) (i32.const 3)
        (br_table 0 1 (i32.const 2))
      )
    )
  )
  "unknown label"
)