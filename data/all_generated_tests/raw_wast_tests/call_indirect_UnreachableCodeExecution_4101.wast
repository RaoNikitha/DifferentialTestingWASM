;; 10. **Test: Invalid Function Return Types Handling**     - Description: Define a function with return types that don't match the expected ones at the caller site using `call_indirect`. When the return types fail validation, expect an `unreachable` instruction execution.     - Constraint: Return type non-conformity causes trap.     - Unreachable Execution: Return type mismatch due to stack inconsistency should head to `unreachable`.

(assert_invalid
  (module
    (type (func (result i32)))
    (func $return-i64 (result i64)
      (i64.const 42)
    )
    (table funcref (elem $return-i64))
    (func $invalid-return-type
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)