;; 7. Use a `loop` that should iterate over `i32`, with an `unreachable` before the loop breaks and a `f32.const` after it, checking if the following type constraint is enforced.

(assert_invalid
  (module (func (result i32)
    (loop (result i32)
      (unreachable)
    )
    (f32.const 1.0)
  ))
  "type mismatch"
)