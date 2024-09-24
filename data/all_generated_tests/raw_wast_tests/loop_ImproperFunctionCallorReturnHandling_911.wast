;; 2. **Test: Indirect Function Call with Incorrect Type**     - Description: Use a loop instruction that contains an indirect function call (`call_indirect`) within the loop block. Pass an incorrect type index that does not match the expected function signature. The function should return a value.     - Constraint: Ensures the implementation enforces type checking for `call_indirect` correctly and raises errors when type mismatch occurs.

(assert_invalid
  (module (func $indirect-call-with-wrong-type (result i32)
    (loop (result i32)
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
  ))
  "type mismatch"
)