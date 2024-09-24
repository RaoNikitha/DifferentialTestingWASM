;; 4. An `if-else` block where the `blocktype` specifies an output type `f64`, but the `else` block incorrectly produces an `i32`, creating a mismatch against the declared block result type.

(assert_invalid
  (module
    (func $type-mismatch-blocktype 
      (if (result f64) 
        (i32.const 1) 
        (then (f64.const 0.0)) 
        (else (i32.const 99))
      )
    )
  )
  "type mismatch"
)