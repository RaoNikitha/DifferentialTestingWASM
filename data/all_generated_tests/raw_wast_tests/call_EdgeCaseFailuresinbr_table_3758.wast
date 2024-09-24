;; 7. **Test for Direct vs Indirect 'br_table' Target Switching**:    - Evaluate the scenario where a 'br_table' can switch between direct and indirect targets, leading to a function call.    - Create a 'br_table' with mixed direct branches and function calls to branches, verifying execution stays as intended.    - This checks for stable functionality when 'br_table' jumps across different method invocations.

(assert_invalid
  (module
    (func $direct_func (nop))
    (func $indirect_func (param i32) (result i32)
      (br_table 0 1 (local.get 0))
    )
    (func $mixed_br_table
      (call 0)
      (call 1 (i32.const 2))
    )
  )
  "type mismatch"
)