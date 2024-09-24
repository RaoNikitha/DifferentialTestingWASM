;; 7. **Control Flow Mismanagement in Deeply Nested Blocks**:    - Construct deeply nested blocks with multiple levels of `loop` and use `br_table` to jump across different levels. Verify the stack unwinding and control flow constraint adherence, preventing infinite loops due to mismanagement.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (loop
              (block
                (br_table 0 1 2 3 (i32.const 4))
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)