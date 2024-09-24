;; 3. **Test Description**: Test a deeply nested function structure where each function has numerous `nop` instructions before returning a value. Ensure the final return value is accurately propagated back to the main function.    - **Constraint Checked**: Verifies nested function call accuracy.    - **Relation to Improper Handling**: Mismanaged `nop` can cause incorrect returns from nested calls.

(assert_invalid 
  (module 
    (func $nested-nops-1 (result i32) 
      (nop) (nop) (nop) (return (i32.const 10)) 
    )
    (func $nested-nops-2 (result i32)
      (nop) (nop)
      call $nested-nops-1
    )
    (func (result i32)
      (nop) (nop)
      call $nested-nops-2
      (return)
    )
  )
  "type mismatch"
)