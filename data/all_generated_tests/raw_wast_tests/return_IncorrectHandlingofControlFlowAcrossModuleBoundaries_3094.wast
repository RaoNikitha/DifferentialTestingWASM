;; 3. **Test 3: Invalid Return Type Check**   Import a function that returns a type that does not match the expected signature of the calling function in another module. Test if the differential behavior arises from incorrect validation of the return type across modules.   **Constraint**: Ensure that the `return` instruction checks whether its operand type matches the expected type signature.   **Relation to Incorrect Handling of Control Flow**: This checks if type validation for return values across module boundaries is consistent.

(assert_invalid
  (module
    (import "env" "mismatch_func" (func $mismatch_func (result i32)))
    (func $invalid_return (result f64)
      (return (call $mismatch_func))
    )
  )
  "type mismatch"
)