;; 6. **Test Description:**    - Test a condition where an imported function with a `br_table` and default label prompts a return to an exported function with complex nested control flows. Assess the control flow's return handling across this transition.    - **Constraint:** Focuses on correct branch handling that respects the nested control flow within the exporting context.    - **Control Flow Boundary Check:** Examine how nested structures are respected across module boundaries during branching.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (br_table 0 1 2 (i32.const 0))))
    (func $main
      (block
        (block (loop (call $external_func) (br_table 0 (i32.const 1))))
      )
      (return)
    )
    (export "main" (func $main))
  )
  "invalid branch target"
)