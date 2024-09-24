;; 2. A nested `if` block where the `then` branch outputs an `f32` type but the `else` branch outputs an `i32` type, resulting in inconsistent stack states between branches.

(assert_invalid
  (module (func $nested-then-f32-else-i32
    (if (result f32)
      (i32.const 1)
      (then (f32.const 1.0))
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)