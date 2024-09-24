;; 10. **Ignoring Inner Block Returns**: Design a function with nested blocks, among which inner blocks have their `return` instructions misclassified. The outermost block uses its `return`, checking that inner `returns` don’t erroneously affect the execution of the outer context.

(assert_invalid
  (module
    (func $ignore-inner-block-return (result i32)
      (block
        (block
          (block
            (return)
          )
          (i32.const 1)
        )
        (i32.const 2)
      )
      (i32.add)
    )
  )
  "type mismatch"
)