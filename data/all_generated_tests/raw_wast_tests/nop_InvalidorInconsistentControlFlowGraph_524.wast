;; 5. **Test `nop` within Breakable Control Blocks**:    Include `nop` in scenarios with breakable control blocks (`loop`, `block`) to test if breaks and falls through behaviors remain consistent.

(assert_invalid
  (module 
    (func (block (nop) (br 0) (nop)))
  )
  "type mismatch"
)