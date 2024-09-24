;; 7. Design a test wherein a function incorporates several `nop` instructions among operations that manipulate multiple stack values, and verify that entering and exiting the function does not lead to stack corruption due to misinterpreted `nop` placement.

(assert_invalid
  (module
    (func $stack-manipulation
      i32.const 42
      i32.const 100
      nop
      i32.add
      nop
      drop
      nop
    )
  )
  "stack mismatch"
)