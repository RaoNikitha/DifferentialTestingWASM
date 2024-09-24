;; 1. A test where an `if` block conditionally calls a function (`call`) that has mismatched input-and-output types according to the blocktype definition, checking if the stack state is correctly managed upon function return.

(assert_invalid
  (module
    (func $mismatched_func (param i32) (result f32)
      f32.const 0.0
    )
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then (call $mismatched_func (i32.const 0)))
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)