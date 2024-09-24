;; 5. **Cross-Block Condition Handling**:    - Create a test where outer block variables set conditions for `br_if` in an inner block, followed by a return. Check for errors in context and condition propagation leading to incorrect returns.

(assert_invalid
  (module
    (func
      (block
        (i32.const 1)
        (block
          (i32.const 0)
          (br_if 1)
          (return))))
    )
  )
  "type mismatch"
)