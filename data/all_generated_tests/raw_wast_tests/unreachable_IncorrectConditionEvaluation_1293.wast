;; 4. Test a loop with a conditional break containing an `unreachable` instruction. Check loop exit behavior. Constraint: Checks whether looping and condition evaluation interact correctly with trap conditions. Example: `(block (loop (br_if 1 (unreachable))))`

(assert_invalid
  (module (func $test-loop-unreachable
    (block (loop (br_if 1 (unreachable))))
  ))
  "type mismatch"
)