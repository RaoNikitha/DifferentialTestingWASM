;; 5. **Test Description:**    - Develop a function with a sequence of `if` conditions that include `unreachable` in one condition which evaluates to false. Ensure that the `unreachable` is only executed when its specific condition is true.    - Constraint: Tests sequential and independent condition handling.    - Relation to Incorrect Condition Evaluation: Checks whether some conditions incorrectly trigger `unreachable`.

(assert_invalid
  (module (func $type-if-conditions-with-unreachable
    (if (i32.const 0) (then (unreachable)))
    (i32.const 1) (drop)
  ))
  "type mismatch"
)