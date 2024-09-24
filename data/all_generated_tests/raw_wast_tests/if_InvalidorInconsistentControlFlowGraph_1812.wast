;; 3. Construct an `if` with an unreachable instruction in the `then` block and an invalid `else` sequence type. Differentiates handling of unreachable code and type mismatches in CFG.

(assert_invalid
  (module (func $unreachable-then-invalid-else
    (if (i32.const 1)
      (then (unreachable))
      (else (f32.const 0.5))
    )
  ))
  "type mismatch"
)