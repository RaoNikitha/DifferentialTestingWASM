;; 10. **Test Forward Branch to Misinterpreted Label**:     Structure an `if` block with branches pointing forward to labels of upcoming blocks which are yet to be introduced. Check whether the forward reference resolves correctly or if it mistakenly resolves to the wrong nesting level.

(assert_invalid
  (module (func $label-misinterpreted
    (block
      (if (result i32) (i32.const 1)
        (then (br 1))
        (else (i32.const 0))
      )
    )
  ))
  "type mismatch"
)