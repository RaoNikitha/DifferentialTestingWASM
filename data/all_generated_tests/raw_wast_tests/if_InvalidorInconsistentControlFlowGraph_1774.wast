;; 5. Formulate an `if` block where the `else` branch contains a `loop`, and check how the CFG manages transitions between the `if`, `else`, and the loop instructions.

(assert_invalid
  (module (func (result i32)
    (i32.const 1)
    (if (result i32) (i32.const 0)
      (then (i32.const 1) (br 0))
      (else (loop (br 1) i32.const 2))
    )
  ))
  "type mismatch"
)