;; 4. **Loop with Multiple Returns and Subsequent Function Calls**:    - Description: Create a loop containing multiple `return` statements, each followed by a `call` to verify if returning from the loop affects subsequent function invocations.    - Constraint: Ensure the operand stack and return values are maintained correctly to not disrupt subsequent calls.    - Relation: Improper return value management can result in incorrect function call sequences post-return.

(assert_invalid
  (module
    (func $multi-return-loop (result i32)
      (loop (result i32)
        (i32.const 1)
        (return)
        (i32.const 2)
        (call $subsequent-func))
      )
    (func $subsequent-func (result i32)
      (i32.const 3))
  )
  "type mismatch"
)