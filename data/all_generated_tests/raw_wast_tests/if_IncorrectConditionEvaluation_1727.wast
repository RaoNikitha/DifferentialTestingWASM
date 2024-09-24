;; - Design a complex nested `if` structure within another `if` block to test if the nesting level is correctly managed and the appropriate branches are taken for each evaluated condition.

(assert_invalid
  (module (func $nested-if-type-mismatch
    (if (result i32)
      (i32.const 1)
      (then
        (if (result i32)
          (i32.const 0)
          (then (i32.const 42))
          (else (i32.const 84))
        )
      )
      (else
        (if (result f32)
          (i32.const 0)
          (then (i32.const 1337))
          (else (f32.const 0.0))
        )
      )
    )
  ))
  "type mismatch"
)