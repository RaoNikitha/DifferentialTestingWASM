;; 10. **Test Description:**     - **Scenario:** Insert `unreachable` in a faulty exception handling block which should ideally not reach this instruction.     - **Constraint Checked:** Confirms if mishandled exceptions cause the `unreachable` to execute and trap.     - **Relation to Unreachable Code Execution:** Tests whether errors in catching exceptions inadvertently trigger `unreachable` causing a trap.

(assert_invalid
  (module
    (type $except (func))
    (import "env" "throw_exception" (func $throw_exception (type $except)))
    (func $test_unreachable_in_exception_block
      (try 
        (do
          (call $throw_exception)
          (unreachable)
        )
        (catch (nop))
      )
    )
  )
  "type mismatch"
)