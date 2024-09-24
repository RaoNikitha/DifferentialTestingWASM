;; 7. **Test Description:**    - Place `unreachable` just before an `end` instruction expected to close a block or loop with a specific type. Ensure the environments correctly handle type propagation.    - **Constraint Checked:** Ensures blocks and loops correctly propagate the expected stack type even with `unreachable`.    - **Relation to Type Mismatch:** Verifies end-of-block type checks against potential disruption by `unreachable`.

(assert_invalid
  (module
    (func $type-block-unreachable-end
      (block (unreachable) (end))
    )
  )
  "type mismatch"
)