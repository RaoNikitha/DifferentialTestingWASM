;; 6. Create a nested `if` within an `if` block where the innermost `else` block attempts to access a label outside its own scope but within the enclosing `if`, producing a CFG conflict.

(assert_invalid
  (module
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (if (result i32)
            (i32.const 1)
            (then
              (i32.const 2)
            )
            (else
              (br 1) ; Incorrectly accessing a label outside its own scope
            )
          )
        )
        (else
          (i32.const 3)
        )
      )
    )
  )
  "invalid label"
)