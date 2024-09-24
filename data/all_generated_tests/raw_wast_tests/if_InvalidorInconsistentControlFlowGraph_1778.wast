;; 9. Implement an `if` with an `else` segment containing a final instruction of `return`, to see if the CFG correctly handles breaking out of the control flow to the function exit.

(assert_invalid
  (module (func $if-else-return-breaking-cfg (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 42))
      (else (return (i32.const 0))))
  ))
  "type mismatch"
)