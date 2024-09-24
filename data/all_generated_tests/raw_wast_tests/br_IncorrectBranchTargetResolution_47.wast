;; 8. Use a series of nested `blocks` and `loops`, directing `br` to an inner loop label from an inner `if`. This tests if the branching instruction resolves the labels in the context of inner loops, ensuring **accurate inner loop targeting**.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (if (result i32) (i32.const 42)
          )
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)