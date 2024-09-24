;; 10. **Test with Nested `if` and Local Variable Access**: Access and modify local variables within nested `if-else` blocks, ensuring that variable states are preserved correctly through nested control changes and exits.

(assert_invalid
  (module (func $nested-if-local-var (result i32)
    (local i32)
    (if (result i32) (i32.const 1)
      (then 
        (local.set 0 (i32.const 2))
        (if (result i32) (i32.const 1)
          (then (local.get 0))
          (else (local.set 0 (i32.const 3)) (local.get 0))
        )
      )
      (else 
        (local.set 0 (i32.const 4))
        (local.get 0)
      )
    )
  ))
  "unreachable code"
)