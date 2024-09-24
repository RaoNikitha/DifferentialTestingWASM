;; 3. **Test Description:**    - Incorporate `unreachable` within a condition inside a nested `block`. Use a `br_if` to exit the block based on a true condition (e.g., 1). Ensure the `unreachable` is not executed erroneously.    - Constraint: Checks nested block and condition interplay.    - Relation to Incorrect Condition Evaluation: Identifies errors in tracking opcode positions within nested structures.

(assert_invalid
  (module
    (func $nested-block-with-br_if
      (block
        (block
          (br_if 1 (i32.const 1))
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)