;; - **Test 9**: Create a scenario with an `if` block containing a function call followed by a conditional branch that leads to another function call, and test if the proper function chain and returns are maintained.

(assert_invalid
  (module
    (func $foo (result i32)
      i32.const 42
    )
    (func (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (call $foo)
          (if (result i32)
            (i32.const 1)
            (then
              (call $foo)
            )
            (else
              (call $foo)
            )
          )
        )
        (else
          (call $foo)
        )
      )
    )
  )
  "type mismatch"
)