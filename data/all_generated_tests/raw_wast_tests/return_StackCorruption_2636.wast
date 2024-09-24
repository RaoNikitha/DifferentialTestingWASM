;; 5. **Test Multiple Return Points**:    - Write a function with multiple conditional return paths, each manipulating the stack differently before returning. Ensure that both implementations can handle multiple exits from the function without corrupting the stack's intended final state.

(assert_invalid
  (module
    (func $multiple-returns (param i32) (result i32)
      (local i32)
      (local.set 0 (i32.const 10))
      (if (result i32)
        (local.get 0)
        (then
          (if (result i32)
            (i32.eqz (local.get 0))
            (then
              (return (i32.const 1))
            )
            (else
              (return (i32.add (local.get 0) (i32.const 2)))
            )
          )
        )
        (else
          (block
            (if (result i32)
              (i32.eqz (local.get 0))
              (then
                (return (i32.const 3))
              )
              (else
                (return (i32.mul (local.get 0) (i32.const 4)))
              )
            )
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)