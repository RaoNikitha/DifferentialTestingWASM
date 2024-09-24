;; 1. **Test Case 1: Inserting a `nop` before an `unreachable` in an empty function:**    - **Constraint Checked:** Ensuring that `nop` does not alter stack or control flow.    - **Expected Behavior:** Execution should skip `nop` and directly hit `unreachable`, causing a trap.    - **Differential Behavior:** wizard_engine might incorrectly initialize context causing the `unreachable` to be executed properly.

(assert_invalid
  (module (func (nop) (unreachable)))
  "unreachable code"
)