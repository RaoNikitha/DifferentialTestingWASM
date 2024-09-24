;; 8. **Early Trap in Long Function:**    - Context: Place `unreachable` early in a long function containing many instructions.    - Constraint: Ensure CFG stops execution early and does not allow further instructions to proceed.    - Expected Behavior: Execution should trap and terminate early when encountering `unreachable`, consistent across implementations.

(assert_invalid
  (module (func $early-trap-in-long-function (unreachable) (i32.const 1) (i32.add) (drop) (i32.const 2) (i32.mul)))
  "type mismatch"
)