;; 6. **Test 6:** Execute `unreachable` after a loop that always executes at least once (`loop` + `br_if` with true), ensuring the loop iterates before trapping.    - **Constraint:** Validate that loops run the necessary iterations before trapping due to `unreachable`.    - **Relation to Infinite Loops:** Ensures that control flow progresses correctly to `unreachable` after one complete loop iteration.

(assert_invalid
  (module (func $loop-unreachable
    (result i32)
    (loop (br_if 0 (i32.const 1)))
    (unreachable)
  ))
  "type mismatch"
)