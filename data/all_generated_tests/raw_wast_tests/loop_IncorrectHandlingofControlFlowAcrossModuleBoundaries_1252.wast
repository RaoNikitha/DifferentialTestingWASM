;; 3. **Indirect Branch to Imported Function in Loop**:    - Test a loop that includes an indirect branch (`br_table`) targeting an imported function. Validate that the transition handles the correct label and function without stack corruption.    - **Constraint**: Ensures correct processing of the branch table index and correct handling of control transfer to imported functions.

(assert_invalid
  (module
    (type $sig (func))
    (import "env" "func" (func $imported (type $sig)))
    (func (result i32)
      (local i32)
      (i32.const 0)
      (loop (result i32)
        (i32.const 0)
        (br_table $imported 0)
      )
    )
  )
  "type mismatch"
)