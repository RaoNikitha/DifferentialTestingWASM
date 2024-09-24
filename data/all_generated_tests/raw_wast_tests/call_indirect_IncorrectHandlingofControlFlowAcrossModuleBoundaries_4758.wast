;; 7. **Test: Procedure Return Type Conformity**    - Description: An imported function is expected to return a specific type. A mismatch in the return type against the expected type should result in a trap.    - Constraint Checked: Function return type conformity.    - Related to Control Flow: Ensures that return values from imported functions match the expected type across module boundaries.

(assert_invalid
  (module
    (type (func (result i32)))
    (import "env" "externalFunc" (func $extFn (type 0)))
    (table funcref (elem $extFn))
    (func $test 
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "return type mismatch"
)