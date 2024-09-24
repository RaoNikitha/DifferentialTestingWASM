;; 7. Generate a complex `if-else-end` block where the operands for the `else` part are misaligned with the expected output type of the `if` leading to CFG errors. Ensures strict type enforcement across control branches.

(assert_invalid
  (module (func $complex-if-else-misaligned (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 1))
      (else (f32.const 0.0))
    )
  ))
  "type mismatch"
)