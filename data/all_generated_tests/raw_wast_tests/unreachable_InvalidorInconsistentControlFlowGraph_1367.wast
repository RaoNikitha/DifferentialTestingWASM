;; 8. **Test Case: Unreachable at Loop Start**    - Description: Insert `unreachable` instruction right at the beginning of a loop to test if the loop execution is immediately stopped.    - CFG Constraint: Validating that no iterations are made if the loop contains an `unreachable` at the start, ensuring proper initial trapping of the loop.

(assert_invalid
  (module (func $unreachable-in-loop
    (loop (unreachable) (i32.const 1) (br 0))
  ))
  "type mismatch"
)