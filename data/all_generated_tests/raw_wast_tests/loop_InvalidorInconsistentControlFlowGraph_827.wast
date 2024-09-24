;; 8. **Complex Loop with Interleaved Branches and Local Operations**:    - Create a complex loop performing several local operations interleaved with multiple `br` instructions targeting itself. Verify all intermediate states and transitions.    - **Constraint**: Ensure context consistency through complex interleaved operations and branches.    - **CFG Check**: The CFG must accurately trace all operations and branch paths within the loop.

(assert_malformed
  (module quote
    "(func (local i32) (loop (result i32) (local.set 0 (i32.const 0)) (br 0) (end)))"
  )
  "loop context validation fails"
)