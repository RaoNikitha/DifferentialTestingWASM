;; 3. **Test Nested `if` with Unreachable in Inner `then` Block**:    - Use nested `if` instructions where the inner `if` has an `unreachable` in the `then` block. Test how state reset impacts the correct execution or unintended trapping.

(assert_invalid
  (module
    (func $nested-if-unreachable
      (if (result i32)
        (i32.const 1)
        (then
          (if (result i32)
            (i32.const 1)
            (then
              unreachable
              (i32.const 42)
            )
            (else
              (i32.const 0)
            )
          )
          (i32.const 2)
        )
        (else
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)