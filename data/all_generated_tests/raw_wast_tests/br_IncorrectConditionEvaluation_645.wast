;; 6. **`br_if` with Complex Logical Condition (AND):**    - A `br_if` using a complex logical AND condition. Check if the branch respects logical operator precedence.    - Constraint Checked: Correct logical AND condition evaluation.    - Relation: Validates evaluation of combined logical conditions.

(assert_invalid
  (module
    (func $test-br-if-complex-logical-condition
      (block
        (i32.const 1)
        (i32.const 0)
        (i32.const 1)
        (i32.and)
        (br_if 0)
      )
    )
  )
  "type mismatch"
)