;; 6. A differential test where the `then` block performs nested `call` instructions leading to a deep call chain, while the `else` block has no function calls. The test assesses if the implementation handles deep call chain changes properly with respect to the operand stack and context propagation.

(assert_invalid
  (module
    (type $t0 (func))
    (func $deep (call $deep)) ;; Defining a function that calls itself
    (func
      (if (result i32) (i32.const 1)
        (then (call $deep) (i32.const 0))
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)