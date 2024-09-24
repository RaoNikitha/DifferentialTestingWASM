;; 10. **Test 10: Control Transfer Interruption via `unreachable`**     - Includes a control transfer instruction like `br` or `br_if` interrupted immediately by `unreachable`.     - Tests if stack transfers (used values) are perfectly managed and cleared when control flow is suddenly interrupted.     - Ensures stack state integrity and no landing into stack underflow/overflow errors.

(assert_invalid
  (module (func $control-transfer-interruption
    (block (br 0 (unreachable)) (i32.const 1))
  ))
  "type mismatch"
)