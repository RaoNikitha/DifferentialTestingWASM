;; 8. **Test Description**:    - Implement a loop with a nested loop and use a `br_table` to target the outer loop's labels.    - Verify if the correct loop and labels are targeted.    - This tests correct label referencing across nested loops.    -

(assert_invalid
  (module
    (func $nested-loop-br_table
      (i32.const 0)
      (loop (result i32)
        (loop (result i32)
          (br_table 1 0 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)