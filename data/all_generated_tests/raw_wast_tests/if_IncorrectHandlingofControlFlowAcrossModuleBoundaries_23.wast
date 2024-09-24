;; 4. **Test Description**: A nested `if` block structure, where the outer `if` calls an imported function and passes its result to an inner `if` as a condition.    **Constraint**: Checks if nested control flow and call-return mechanisms between modules handle stack transitions cleanly.    **Goal**: Detects nested flow handling bugs and improper reset behavior.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (result i32)
      (if (result i32)
        (call $external_func)
        (then
          (if (result i32)
            (call $external_func)
            (then (i32.const 1))
            (else (unreachable))
          )
        )
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)