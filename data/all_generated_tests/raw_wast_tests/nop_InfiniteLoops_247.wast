;; 8. **Test 8: Loop with External Function Call and `nop`**:    - **Description**: A `loop` that makes an external function call on each iteration interspersed with `nop` instructions.    - **Constraint**: Ensure that `nop` does not obstruct function calls or loop’s control flow.    - **Relation to Infinite Loops**: Validates that `nop` does not mistakenly keep the function call out of execution, preventing loop termination.    - **Example**: `(loop $L (nop) (call $someFunction) (br_if $L (i32.const 0)))`

(assert_invalid
  (module
    (func $someFunction)
    (func $test
      (loop $L
        (nop)
        (call $someFunction)
        (br_if $L (i32.const 0))
      )
    )
  )
  "type mismatch"
)