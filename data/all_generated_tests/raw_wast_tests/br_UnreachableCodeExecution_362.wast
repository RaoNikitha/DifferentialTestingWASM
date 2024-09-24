;; 3. **Test Description:** Develop a series of nested `if-else` structures with a `br` instruction targeting the outermost block's end. Add an `unreachable` instruction just after the `br` to confirm correct branching.     - **Constraint Checked:** Correct handling of branching out from nested `if-else` structures.     - **Relation to Unreachable Code Execution:** Tests if improper branching leads to reaching the `unreachable` instruction.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (br 1)
          (unreachable)
        )
        (unreachable)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)