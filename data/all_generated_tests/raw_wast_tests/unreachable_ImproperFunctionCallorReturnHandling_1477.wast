;; 8. **Test 8: Unreachable After Indirect Function Call**    - Description: Place `unreachable` immediately after an indirect function call.      - *Constraint:* Checks if the control flow is trapped after the indirect call.      - *Improper Handling Check:* Confirms that indirect calls do not allow further execution beyond `unreachable`.

(assert_invalid
  (module (func $type-unreachable-after-indirect-call
    (call_indirect (type 0) (i32.const 0) (unreachable) (i32.const 1))
    (table 1 funcref)
    (type (func (param i32) (result i32)))
  ))
  "type mismatch"
)