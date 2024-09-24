;; 4. **Test: Brackets and Unreachable in a Block**    - **Description:** Define nested blocks with interleaved branch instructions (`br`) and place an `unreachable` instruction to test if exiting blocks improperly handle the `unreachable` causing a trap.    - **Constraint Checked:** Checks handling of block exits and `unreachable` correctness in nested structures.    - **Relation to Mismanagement of Block Nesting:** Verifies if the implementation properly manages nested block exits when `unreachable` is present.

(assert_invalid
  (module
    (func $nested-blocks-with-unreachable (result i32)
      (block (result i32)
        (block (br 1))
        (block (br 0) (unreachable))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)