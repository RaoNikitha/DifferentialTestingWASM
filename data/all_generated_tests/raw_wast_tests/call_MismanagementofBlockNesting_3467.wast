;; 6. **Nested Conditional Blocks with Multiple Calls**:    - Test multiple `call` instructions within nested conditional blocks, altering the conditions. Check returning to the correct conditional block post-call.    - Ensure index parsing doesn’t unintentionally exit the current block.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (func $inner (param i32) (i32.const 42))
    (func $outer (param i32) 
      (if
        (i32.const 1)
        (then
          (call $inner (i32.const 10))
          (if
            (i32.const 1)
            (then
              (call $outer (i32.const 20))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)