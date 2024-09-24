;; 8. **Test for `nop` Before and After `unreachable`**:    - **Description**: Insert `nop` before and after an `unreachable` instruction and validate stack state handling.    - **Constraint Checked**: Ensures the stack state remains consistent when a no-op is introduced around an instruction that terminates execution.    - **Relation**: Verifies `nop` does not interfere with termination instructions and maintains stack integrity.

(assert_invalid
  (module
    (func
      (nop)
      (unreachable)
      (nop)))
  "type mismatch"
)