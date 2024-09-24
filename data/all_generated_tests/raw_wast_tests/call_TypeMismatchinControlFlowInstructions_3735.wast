;; 4. **Function Call with Excess Arguments in Loop**:    - **Description**: Invoke a function call within a loop structure providing more arguments than required.    - **Reasoning**: Ensures that excess arguments are correctly identified and errors raised.    - **Constraint**: Detects implementation inconsistencies in argument counting within loops.    - **Relation**: Confirms loop-handling consistency for function calls.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $excess-args (param i32 i32)
      (loop
        (call 0 (i32.const 10) (i32.const 20) (i32.const 30))
      )
    )
    (func (param i32) (result i32) (i32.const 42))
  )
  "type mismatch"
)