;; 1. **Test 1**: Create a `call_indirect` instruction that dynamically resolves a function whose type does not match the expected type. Ensure the mismatch is subtle, e.g., differing return types while the parameter types match. Check if the OCaml implementation traps correctly, while the Java implementation throws an unexpected error.

(assert_invalid
  (module
    (type $expected_type (func (param i32) (result i64)))
    (type $actual_type (func (param i32) (result i32)))
    (func $mismatched_func (type $actual_type) (param i32) (result i32) (i32.const 42))
    (table funcref (elem $mismatched_func))
    (func $call_indirect_test
      (call_indirect (type $expected_type) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)