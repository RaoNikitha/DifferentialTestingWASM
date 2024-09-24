;; 5. **Test Nested Loop with Incorrect Label Indexing**:    Design a nested loop structure where an inner loop `br_if` wrongly refers to the outer loop due to incorrect label indexing. This should result in an infinite loop.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (loop (result i32)
          (br_if 1 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)