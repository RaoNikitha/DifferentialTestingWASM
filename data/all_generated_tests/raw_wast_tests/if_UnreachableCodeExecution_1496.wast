;; 7. **Unreachable in Deeply Nested `else` Block**:    - Construct deeply nested `if` structures with an `unreachable` in one of the innermost `else` blocks. Check if Wizard Engine’s reset mechanism prevents this trap.

(assert_invalid
  (module
    (func $deeply_nested_unreachable
      (i32.const 0)
      (if (result i32)
        (then
          (if (result i32)
            (then
              (if (result i32)
                (then
                  (if (result i32) (i32.const 1) (else (i32.const 1) (unreachable)))
                )
              )
            )
          )
          (i32.const 0)
        )
        (else
          (if (result i32)
            (then (i32.const 1))
            (else (unreachable))
          )
        )
      )
    )
  )
  "unreachable executed in else block"
)