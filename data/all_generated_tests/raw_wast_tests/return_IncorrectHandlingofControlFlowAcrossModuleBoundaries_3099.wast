;; 8. **Test 8: Mismatching Return Values**   Import a function from another module that is called within a loop in the main module. The imported function returns values, which are expected to match the main module's loop handling. Check for any inconsistencies.   **Constraint**: Ensure returning from loops across module boundaries maintains stack and operand expectations.   **Relation to Incorrect Handling of Control Flow**: Validates loop-based return value handling consistency.

(assert_invalid
 (module
  (import "mod" "func" (func $imported (result i32)))
  (func (result i32)
   (loop
    (call $imported)
    (return)
   )
  )
 )
 "type mismatch"
)