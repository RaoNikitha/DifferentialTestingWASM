;; 2. **Test Unreachable in Conditional Branch:**    - Include an `if` statement with an `unreachable` instruction in the `then` branch and valid instructions in the `else` branch. Check for proper execution of the `else` branch without interference.    - **Constraint Checked:** Proper handling of control flow when `unreachable` is part of a conditional branch.    - **CFG Relation:** Faulty CFG might fail to recognize that the `else` branch remains executable despite the `unreachable` in the `then` branch.

(assert_invalid
 (module (func (if (i32.const 0) (then (unreachable)) (else (i32.const 1))))
  "type mismatch"
)