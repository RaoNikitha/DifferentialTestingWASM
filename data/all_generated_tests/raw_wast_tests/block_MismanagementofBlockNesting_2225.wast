;; 6. **Test 6: Mixed Value Type and Type Index in Nested Blocks**    - **Description:** A nested block sequence utilizing both `valtype?` and `typeidx` `blocktype` annotations, with branching within nested structures.    - **Constraint:** Verifies correct `blocktype` interpretation within nested blocks.    - **Mismanagement Check:** Ensures correct handling of `blocktype` when mixed types are used, avoiding confusion in reinterpretation of types.

(assert_invalid
  (module (func $mixed-block-type (result i32)
    (block (result i32) 
      (block (type 0) 
        (br 0 (i32.const 1))
      )
      (i32.const 2)
    )
  ))
  "type mismatch"
)