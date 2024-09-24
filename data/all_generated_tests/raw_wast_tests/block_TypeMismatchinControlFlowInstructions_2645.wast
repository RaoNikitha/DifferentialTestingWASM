;; 6. Implement a block where an `if` statement—expecting an `i32` type in its result—is resolved inside the block with an `f64` type. This test checks for type checking across compound control flow structures.

(assert_invalid
  (module (func $type-check-compound-control (result i32)
    (block (result i32)
      (if (result i32) (i32.const 1)
        (then (f64.const 1.0))
        (else (f64.const 2.0))
      )
    )
  ))
  "type mismatch"
)