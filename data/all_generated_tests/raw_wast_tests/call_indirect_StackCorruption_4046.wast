;; 5. **Test 5: Returning Incorrect Type Sequence**:    Design a `call_indirect` call where the function returns a sequence of types that do not match the expected type sequence. Ensure that the stack correctly captures this mismatch and traps, preserving stack integrity.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (result i64)))
    (table funcref (elem 0 0))
    (func $func-i64 (type 1) (i64.const 42))
    (func $test-func
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)