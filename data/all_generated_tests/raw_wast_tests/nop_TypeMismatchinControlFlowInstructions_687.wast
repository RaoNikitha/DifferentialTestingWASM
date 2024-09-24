;; Test 8: Include `nop` before an `if` control instruction with mismatched stack requirements per branch — one branch expecting `i32` and the other `f32`. Validate if correct type mismatch is detected due to `nop`.

(assert_invalid
  (module
    (func (result i32)
      (nop)
      (if (result i32) (i32.const 0) (then (i32.const 0)) (else (f32.const 0.0)))
    )
  )
  "type mismatch"
)