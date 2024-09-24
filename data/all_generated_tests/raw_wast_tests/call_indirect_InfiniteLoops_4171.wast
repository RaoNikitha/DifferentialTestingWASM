;; 10. **Test Description**:     Unreachable `call_indirect` in Loop:     - Constraint: Ensure handling of unreachable `call_indirect` instruction within a loop doesn't cause infinite looping.     - Test Behavior: Create a loop with an unreachable `call_indirect` instruction guaranteeing that it properly identifies reaching an erroneous state and does not loop infinitely.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $unreachable-call-indirect
      (block
        (loop
          (unreachable)
          (call_indirect (type 0) (i32.const 0))
        )
      )
    )
  )
  "unreachable instruction"
)