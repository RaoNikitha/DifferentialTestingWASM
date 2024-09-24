;; 5. **Test Description**: Write a test wherein the `if` instruction has a block type `[i32] -> [i64]`, but the `then` branch results in `f64`.    - **Constraint Checked**: Ensure the correct type is produced as defined by the block's output type.    - **Expected Behavior**: Differential implementations may fail to trap this mismatch, leading to type errors.

(assert_invalid
  (module
    (type $sig (func (result i64)))
    (func
      (i32.const 1)
      (if (result i64)
        (then (f64.const 0.0))
      )
    )
  )
  "type mismatch"
)