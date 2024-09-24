;; 6. **Test Description:**    - Construct a loop where `unreachable` is inside a conditional break (`br_if`) that depends on a dynamic runtime condition. Make sure the loop only exits via correct condition and not falsely triggered `unreachable`.    - Constraint: Validates dynamic condition within loops.    - Relation to Incorrect Condition Evaluation: Validates runtime conditions do not incorrectly align `unreachable`.

(assert_invalid
  (module (func $type-loop-unreachable-br_if-condition
    (loop (br_if 0 (i32.const 1) (unreachable)) (unreachable))
  ))
  "type mismatch"
)