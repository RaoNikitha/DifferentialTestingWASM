;; 3. **Test Description:**     Examine the scenario where a `call` instruction leads to a function containing an `unreachable`, and then contextually check if the trap is handled consistently across functions before transitioning control.    **Constraint Checked:** Consistent handling of traps across function boundaries.    **Relation to Improper Call/Return Handling:** Ensures functions calling an `unreachable` trapped function handle the trap and do not proceed incorrectly.

(assert_invalid
  (module 
    (func $callee (unreachable))
    (func (call $callee) (i32.const 1) drop)
  )
  "type mismatch"
)