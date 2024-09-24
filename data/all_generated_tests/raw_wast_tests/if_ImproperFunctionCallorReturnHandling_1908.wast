;; 9. **Type Mismatch in Return After Function Call**:    - Ensure the result of a function call and the block type after returning are mismatched.    - Check whether implementations correctly enforce type constraints upon return.

(assert_invalid
  (module
    (func $type-mismatch-after-func-call (result i32)
      (if (result i32)
        (i32.const 1)
        (then (call 0) (i32.const 0)) ;; Call to function returning unexpected type
        (else (i32.const 0))
      )
    )
    (func (result f64) (f64.const 0)) ;; Function with type mismatch for return
  )
  "type mismatch"
)