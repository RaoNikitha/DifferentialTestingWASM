;; 10. **Test Description:**     - Test a scenario with multiple modules interacting, where an exported function having a `br_table` calls an imported function, which again calls a different exported function performing another `br_table`. Ensure overall control flow and stack state consistency.     - **Constraint:** Ensures the correct order and stack handling in scenarios with multi-level `br_table` operations across module boundaries.     - **Control Flow Boundary Check:** Confirms maintained integrity of control operations and stack states across complex inter-module function interaction chains.

(assert_invalid
  (module
    (import "mod1" "func1" (func $imported (result i32)))
    (import "mod2" "func2" (func $imported2))
    (func $br_table_test
      (call $imported)
      (block (br_table 0 1 (i32.const 0)))
    )
    (func (export "func1")
      (block
        (call $imported2)
        (br_table 0 1 (i32.const 1))
      )
    )
    (func (export "func2")
      (block
        (i32.const 0)
        (br_table 0 0 (i32.const 2))
      )
    )
  )
  "type mismatch"
)