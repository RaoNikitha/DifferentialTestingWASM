;; 4. **Test Description:**    - Set up multiple nested blocks where a `br_if` inside the innermost block relies on a compound condition (logical AND/OR operations). Test condition accuracy by altering individual components dynamically.    - **Constraint Checked:** Correct logical evaluation and subsequent branching of compound conditions.    - **Test Relation:** Ensures that compound conditions in `br_if` are accurately processed for correct branch decision.

(assert_invalid
  (module
    (func $compound_condition_br_if
      (block
        (block
          (block
            (i32.const 1)
            (i32.const 0)
            (i32.and)
            (br_if 2)
          )
        )
      )
    )
  )
  "type mismatch"
)