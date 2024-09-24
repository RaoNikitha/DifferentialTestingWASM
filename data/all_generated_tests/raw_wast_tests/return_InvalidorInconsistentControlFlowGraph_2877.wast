;; 6. **Return in Deeply Nested Structures**:    - Design a function containing deeply nested blocks and loops, each containing a `return` statement. This test examines how the CFG handles deeply nested structures with return statements, ensuring correct stack unwinding and control flow management.

(assert_invalid
  (module
    (func $nested-return (result i32)
      (block
        (loop
          (block
            (loop
              (return (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)