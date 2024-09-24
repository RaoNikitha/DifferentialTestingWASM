;; 2. **Test Description:**     Ensure that a function containing an `unreachable` instruction followed by a `return` is properly trapped before the return statement can execute.    **Constraint Checked:** Immediate trap on `unreachable` and prevention of further execution.    **Relation to Improper Call/Return Handling:** Verifies that `unreachable` preempts the return process, ensuring no improper return behaviors occur.

(assert_invalid
  (module (func $test-unreachable-followed-by-return 
    (unreachable) (return)
  ))
  "unreachable preempts return"
)