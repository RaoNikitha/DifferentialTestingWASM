;; - **Test 5**: Use a `br_if` instruction to break out of a loop where the call instruction expects a different type (`i32` instead of `f64`). This tests breaking out of control flow and stack state consistency.

(assert_invalid
  (module
    (func $type-mismatch-br_if
      (loop 
        (br_if 0 (call 1))
      )
    )
    (func (param f64))
  )
  "type mismatch"
)