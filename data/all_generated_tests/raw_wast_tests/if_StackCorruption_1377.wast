;; 8. **Test Description**:    Implement an `if` block where the `then` branch leads to a forward branch that manipulates the stack (adding/removing several integers) and afterward the `else` block follows typical control flow. Validate the stack height consistency upon block exit.

(assert_invalid
  (module (func $mixed-stack-manipulation (param i32) (result i32)
    (if (result i32) (local.get 0)
      (then
        (block $label1
          (i32.const 2)
          (br $label1)
          (i32.const 3)
          (drop)
        )
        (i32.const 4)
      )
      (else
        (i32.const 5)
      )
    )
  ))
  "type mismatch"
)