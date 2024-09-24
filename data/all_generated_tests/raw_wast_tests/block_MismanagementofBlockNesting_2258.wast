;; 9. **Test Description**: Implement a complex nested structure with interleaving blocks and loops interspersed with `br_table` instructions. Ensure branching cases cover all nested depth levels appropriately.    - **Constraint**: Validate accurate depth-level resolution for `br_table` in interleaved nested structures.    - **Nesting Mismanagement Check**: Confirms correct target resolution and execution for complex nested and interleaved structures.

(assert_invalid
  (module 
    (func $complex-nested-br_table
      (result i32)
      (block (result i32)
        (block $outer (result i32)
          (block $inner (result i32)
            (loop $loop
              (block (result i32) (br_table 0 1 2 (i32.const 0))) 
              (block (result i32) (br_table 0 1 2 (i32.const 1)))
              (block (result i32) (br_table 0 1 2 (i32.const 2)))
            )
            (br 1)
          )
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)