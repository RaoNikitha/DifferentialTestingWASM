;; 4. **Function Calls Inside Block Exit Instructions**:    - Test function calls right before block exit instructions like `br` or `br_table`. Ensure the call returns before the block exits and the exit instructions target the right block.    - Verify if function index parsing impacts the control flow.

(assert_invalid
  (module
    (func $func1 (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $func2
      (block
        (call $func1 (i32.const 0))
        (br 0)
      )
    )
  )
  "type mismatch"
)