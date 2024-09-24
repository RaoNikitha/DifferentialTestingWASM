;; 9. **Mixed Loops and Conditional Blocks with Calls**:    - Create mixed structures with loops inside conditional blocks with function calls. Verify complex nested returns and correct block continuation.    - Evaluate if index parsing captures correct function scopes without exiting incorrect blocks.

(assert_invalid
  (module
    (func $nested-block-with-call
      (block
        (if (result i32)
          (then
            (loop (result i32)
              (i32.const 1)
              (call 1)
            )
          )
        )
      )
    )
    (func (param i32) (result i32))
  )
  "type mismatch"
)