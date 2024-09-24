;; 4. **Test Description:**    - Test a `br_table` inside an exported function that branches to an imported function, which in turn calls another exported function. Ensure control flow and stack states are preserved across these boundaries.    - **Constraint:** Checks that branching from an exported context to an imported function still adheres to expected stack scenarios.    - **Control Flow Boundary Check:** Ensures multi-level inter-module control transfers do not corrupt execution state.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (result i32)))
    (func $exported_func (export "exported_func") (result i32)
      (block (result i32)
        (br_table 0 1 (call $imported_func) (i32.const 0))
      )
      (i32.const 1)
    )
    (func $another_exported (export "another_exported") (result i32)
      (call $exported_func)
    )
  )
  "unknown label"
)