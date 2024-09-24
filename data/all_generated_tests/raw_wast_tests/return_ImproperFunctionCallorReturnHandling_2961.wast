;; 10. Test handling of unreachable code block returns:    - Create a function with blocks marked as unreachable before `return` is called.    - Analyze whether the function recognizes the unreachable code correctly and handles return instructions from such blocks consistently.

(assert_invalid
  (module
    (func $unreachable-before-return (result i32)
      (block (result i32)
        unreachable
        (return (i32.const 42))
      )
    )
  )
  "type mismatch"
)