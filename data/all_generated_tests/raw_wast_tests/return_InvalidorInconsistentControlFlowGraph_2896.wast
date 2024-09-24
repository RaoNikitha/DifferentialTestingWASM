;; 5. **Return from within If-Else Branch**:    A function featuring an `if-else` block, where each branch contains a `return`.    - Checks CFG handling of conditional branches that terminate early with a return.

(assert_invalid
  (module
    (func $nested-if-return (result i32)
      (i32.const 0)
      (if (result i32) (then (return (i32.const 0))) (else (return (i32.const 1))))
    )
  )
  "type mismatch"
)