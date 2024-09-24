;; 9. **Test `nop` in the Context of Variable Assignments**:    Add `nop` between variable assignments and uses to ensure the flow of data through variables remains correct.

(assert_invalid
  (module
    (func (local i32) (local.set 0 (i32.const 10)) (nop) (i32.const 5) (local.set 0))
  )
  "type mismatch"
)