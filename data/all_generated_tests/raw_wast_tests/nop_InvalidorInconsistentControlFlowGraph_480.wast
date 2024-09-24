;; 1. **Test with `nop` Inside an Empty Loop:**    - Verify that placing a `nop` inside an empty loop does not affect the control flow. The test will check if the execution correctly identifies the loop as valid, even if the loop only contains a `nop` instruction.    - **Constraint Tested:** Ensures `nop` keeps the stack unchanged, even within control structures.

(assert_valid
  (module
    (func $test-loop (loop (nop) (br 0))))
)