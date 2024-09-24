;; 10. **Label Indexing Misinterpretation in Structured Blocks**:    - Create a setup where label indexing might be misinterpreted within nested structures. Ensure that the `br_table` implementation correctly identifies and branches to the intended labels without causing infinite loops from wrong index interpretations.

(assert_invalid
  (module
    (func $label-indexing-nested-structures
      (block (result i32)
        (block
          (block (result i32)
            (block
              (br_table 0 1 2 (i32.const 3))
            )
            (i32.const 1)
          )
          (i32.const 2)
        )
        (i32.const 0)
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)