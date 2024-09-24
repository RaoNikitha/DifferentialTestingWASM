;; 5. **Test Unreachable in Middle of Code Sequence:**    - Place `unreachable` in the middle of code sequence, with valid instructions both before and directly after it. Check if instructions before are executed while those after are not.    - **Constraint Checked:** Ensure instructions preceding `unreachable` are executed up to the trap.    - **CFG Relation:** An erroneous CFG might incorrectly align the execution paths, ignoring the trap and executing instructions post `unreachable`.

(assert_invalid
  (module (func $test-unreachable-in-middle-of-sequence
    (i32.const 1) (unreachable) (i32.const 2)
  ))
  "type mismatch"
)