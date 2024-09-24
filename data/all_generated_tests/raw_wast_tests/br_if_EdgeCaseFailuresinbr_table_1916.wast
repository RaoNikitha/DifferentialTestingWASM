;; 7. **Test 7: `br_if` followed by multiple `br` instructions within nested structures**    - **Constraint**: Ensures correct execution order and stack management for mixed conditional and unconditional branches.    - **Check**: Examines stack state and execution flow.    - **Relation to Edge Cases**: Verifies if `br_table` maintains stack state across multiple complex jumps like nested `br_if` and `br`.

(assert_invalid
  (module 
    (func $nested-br-if-mixed (block 
      (br_if 0 (i32.const 0))
      (block (br 1))
      (block (br_if 0 (i32.const 1)))
      (block (br 0))
      (block (br_if 2 (i32.const 1)))
    ))
  )
  "unknown label"
)