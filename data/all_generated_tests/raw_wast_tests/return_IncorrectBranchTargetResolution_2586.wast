;; 5. **Test with Mixed Function and Block Call**    - **Description**: Call multiple nested blocks and functions sequentially within a function, with a `return` inside a nested call.    - **Constraint**: Checks that the `return` correctly targets the outermost function rather than any intermediate block or function call.

(assert_invalid
  (module
    (func $outer (result i32)
      (block $blk
        (call $inner)
        (i32.const 1)
      )
    )
    (func $inner
      (return (i32.const 2))
    )
  )
  "type mismatch"
)