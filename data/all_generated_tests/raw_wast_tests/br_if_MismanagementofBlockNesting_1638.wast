;; 9. **Multi-Level Conditional with Loops**:    - **Description**: Place nested blocks and loops where `br_if` branches from within block/loops at multiple levels. This ensures correct handling of control flow in nested mixed structures.    - **Constraint Checked**: Label References, Relative Label Lookup.    - **Expected Failure**: wizard_engine may throw `OobLabel` errors due to misinterpretation of nested control flow boundaries.

(assert_invalid
  (module
    (func $multi_level_conditional_with_loops
      (block (loop
        (block (if (br_if 1 (i32.const 1)) (br 2)))
      ))
    )
  )
  "unknown label"
)