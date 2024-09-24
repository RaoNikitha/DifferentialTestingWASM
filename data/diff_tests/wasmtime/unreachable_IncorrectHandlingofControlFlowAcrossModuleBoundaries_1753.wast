;; 4. **Test 4: Loop with `unreachable` in an Imported Function**    - Description: Implement a loop in the main module that repeatedly calls an imported function which contains an `unreachable` instruction. Verify that the trap interrupts the loop correctly.    - Constraint Checked: Checks if the loop control structure across module boundaries respects the trap caused by `unreachable`.    - Relation: Addresses how looping constructs behave when they encounter traps in an inter-module function call.

(assert_invalid
  (module
    (import "env" "trap_function" (func $trap_function))
    (func $main_func
      (loop (call $trap_function) (br 0))
      )
    )
  "unreachable executed in imported function"
)