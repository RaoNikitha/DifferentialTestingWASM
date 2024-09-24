;; 3. **Test for Deep Nesting of `if`-`else` Blocks**: Construct a test with multiple nested `if-else` blocks to ensure that each nested `if` evaluates and terminates correctly, and verify structured control maintains correct branch jumps.

(assert_invalid
  (module (func $nested-if-else (result i32)
    (if (result i32)
      (i32.const 1)
      (then
          (if (result i32)
            (i32.const 0)
            (then
                (i32.const 2)
                (if (result i32)
                  (i32.const 1)
                  (then (i32.const 3))
                  (else (i32.const 4))
                )
            )
            (else (i32.const 5))
          )
      )
      (else (i32.const 6))
    )
  ))
  "type mismatch"
)