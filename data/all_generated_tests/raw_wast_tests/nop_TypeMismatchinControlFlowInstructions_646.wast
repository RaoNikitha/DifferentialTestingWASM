;; 7. An `if` statement where the conditionally executed blocks include `nop` but expect push/pop operations on the stack that mismatch the main function’s stack state.

(assert_invalid
  (module
    (func (result i32)
      (if (i32.const 0)
        (then (nop) (i32.const 1))
        (else (nop) (f32.const 2.0))
      )
    )
  )
  "type mismatch"
)