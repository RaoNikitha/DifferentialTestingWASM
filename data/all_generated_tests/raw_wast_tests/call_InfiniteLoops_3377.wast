;; 6. **Loop with Function Call Increasing Stack Depth**:    - **Description**: Implement a loop where each iteration includes a `call` instruction that adds more values onto the stack until overflow, without proper popping.    - **Reason**: Tests the implementation accuracy regarding stack operations and overflow conditions. Incorrect handling can result in infinite loops due to improper stack depth management.

(assert_invalid
  (module
    (func $loop-with-call-increasing-stack-depth
      (loop
        (call 1)
        (br 0)
      )
    )
    (func (result i32) (i32.const 1) (i32.const 1))
  )
  "stack overflow"
)