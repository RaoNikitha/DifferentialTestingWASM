;; Test 7: Design a function with multiple nested blocks where each block pushes different values onto the stack. Use a `return` instruction in the innermost block to return a specific value from the outermost block. Verify correct stack unwinding and return value.

(assert_invalid
  (module
    (func $type-nested-blocks-unwind (result i32)
      (block
        (block
          (i32.const 42)
          (block
            (return)
            (i32.const 58)
          )
          (return)
        )
        (i32.const 99)
      )
    )
  )
  "type mismatch"
)