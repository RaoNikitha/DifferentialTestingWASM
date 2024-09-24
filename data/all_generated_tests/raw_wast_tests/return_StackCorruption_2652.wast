;; 1. **Test 1: Function Exiting on Conditional with Unwinding**    - Create a function with nested blocks and a conditional returning from the middle block, stacking values at each layer. Ensure `else` block has different stack manipulations to check for proper unwinding.    - *Related Constraint*: Ensures correct stack unwinding to outermost block on conditional return.

(assert_invalid
  (module
    (func $nested-return-unwind (result i32)
      (i32.const 10)
      (block (result i32)
        (i32.const 20)
        (block (result i32)
          (i32.const 30)
          (if (i32.const 1)
            (then (return))
            (else (i32.const 40))
          )
        )
        (drop)
      )
    )
  )
  "type mismatch"
)