;; 5. **Test Description:**    - **Scenario:** Place the `unreachable` instruction after a `br` instruction to an outer block, which ideally shouldn't execute the `unreachable`.    - **Constraint Checked:** Ensures that branch conditions that misjudge the destination cause a trap.    - **Relation to Unreachable Code Execution:** Ensures that incorrect branching fails by hitting `unreachable`.

(assert_invalid
  (module (func $type-br-to-outer-block-with-unreachable
    (block (block (br 1) (unreachable)))
    (i32.const 1)
  ))
  "type mismatch"
)