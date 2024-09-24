;; 8. **Test Trapping on Direct Call to Unreachable via Indirect Call**:    - **Description**: Setup call_indirect to point to a function that performs an indirect call to another function containing an 'unreachable' instruction.    - **Constraint Checked**: Verify indirect calls within indirectly called functions.    - **Relation to Unreachable**: Ensure correct trapping behavior if the second-level indirect call reaches 'unreachable'.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (type $inner_sig (func))
    (func $unreachable_func (unreachable))
    (table funcref (elem $unreachable_func))
    (func (type $sig)
      (call_indirect (type $inner_sig) (i32.const 0))
    )
  )
  "type mismatch"
)