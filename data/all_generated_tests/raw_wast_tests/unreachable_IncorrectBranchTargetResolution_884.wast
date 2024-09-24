;; 5. **Test Unreachable at Second Level Block and Branch Out:**    - Implement `unreachable` at the second level of nested blocks, with `br` targeting an outer label.    - *Constraint*: Verifies that deep nested structures resolve exit branches properly, skipping over deeper levels.    - *Relation to Branch Resolution*: Differentiate handling multiple layer block exits correctly post `unreachable`.

(assert_invalid
  (module (func $test-unreachable-second-level-block
    (block
      (block
        (unreachable)
        (br 1)
      )
    )
  ))
  "type mismatch"
)