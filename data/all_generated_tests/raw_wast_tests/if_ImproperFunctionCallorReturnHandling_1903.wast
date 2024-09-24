;; 4. **Invalid Return Type from Called Function**:    - Function `B` returns an `f32` while the `if` block expects an `i32`.    - Ensure the return is properly detected and handled, showing differential behavior if the wrong type bypasses or crashes the stack.

(assert_invalid
  (module
    (func $type-mismatch-called-function (result i32)
      (if (result i32)
        (i32.const 1)
        (then (call $funcB))
        (else (i32.const 1))
      )
    )
    (func $funcB (result f32)
      (f32.const 1.0)
    )
  )
  "type mismatch"
)