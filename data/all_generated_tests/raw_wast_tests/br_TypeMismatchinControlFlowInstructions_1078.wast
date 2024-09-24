;; 9. Construct a block expecting an array of integers as the result and using `br` to exit without providing an array on the stack. This test focuses on whether the implementation correctly handles type enforcement for array data structures.

(assert_invalid
  (module
    (func (result (array i32))
      (block (result (array i32))
        (br 0)
      )
    )
  )
  "type mismatch"
)