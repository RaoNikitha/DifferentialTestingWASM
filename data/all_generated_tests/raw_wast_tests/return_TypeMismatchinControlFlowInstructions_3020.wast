;; Use an `if-else` construct within a function where the `if` arm and the `else` arm push different types onto the stack before executing `return`, causing a type mismatch in the `return`.

(assert_invalid
  (module
    (func $type-mismatch-in-if-return (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (return (i32.const 42))
        )
        (else
          (return (f32.const 42.0))
        )
      )
    )
  )
  "type mismatch"
)