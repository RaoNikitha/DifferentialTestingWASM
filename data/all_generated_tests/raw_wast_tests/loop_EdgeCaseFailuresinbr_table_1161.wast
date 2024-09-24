;; 2. **Test Description**:     Design a loop containing nested loops and a complex `br_table` instruction branching to both outer and inner loops based on an index.     - **Constraint**: Validates correct branch resolution within nested control structures.     - **Edge Case**: Ensures that `br_table` properly resolves branches in sophisticated nested contexts.

(assert_invalid
  (module 
    (func $complex-br_table 
      (param i32) (result i32)
      (local i32)
      (block $outer
        (block $inner
          (loop $loop1 (param i32) (result i32)
            (i32.const 0)
            (set_local 0)
            (loop $loop2 (param i32) (result i32)
              (i32.const 1)
              (br_table $outer $inner $loop1 $loop2 (get_local 0))
              (get_local 0)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)