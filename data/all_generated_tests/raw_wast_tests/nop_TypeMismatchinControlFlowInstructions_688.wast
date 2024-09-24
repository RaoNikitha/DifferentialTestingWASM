;; Test 9: Use a `nop` immediately before the `end` of a `block` returning `i64`, where the stack is left with a different type (`f64`). Check if type mismatch due to misplaced `nop` is detected at block exit.

(assert_invalid
  (module (func (result i64)
    (block (result i64)
      (f64.const 0.0)
      (nop)
    )
  ))
  "type mismatch"
)