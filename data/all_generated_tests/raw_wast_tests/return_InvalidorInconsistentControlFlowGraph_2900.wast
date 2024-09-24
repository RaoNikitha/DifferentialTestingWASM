;; 9. **Return After a Nested Call**:    Perform a nested function call within the block, followed by a `return`.    - Ensures proper stack unwinding and CFG reflection when combining nested calls and returns.

(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-call-nested-return (result i32)
      (i32.const 1)
      (block
        (call 1)
        (return)
      )
    )
    (func (param i32) (result i32) (local.get 0))
  )
  "type mismatch"
)