;; 2. Write a deeply nested `if` block with multiple layers of functions calls interlaced with returns, ensuring that each call adheres to the defined function signature at every nested level.

(assert_invalid
  (module
    (func $deep-nested-if (param i32) (result i32)
      (if (result i32)
        (if (result i32)
          (if (result i32)
            (if (result i32)
              (i32.const 1)
              (then (return (i32.const 42)))
            )
            (then (return (i32.const 41)))
          )
          (else (return (i32.const 40)))
        )
        (else (return (i32.const 39)))
      )
    )
  )
  "type mismatch"
)