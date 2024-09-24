;; 3. **Test Description:**    A function implementing successive blocks, each with a `br_if` instruction at different nesting levels after `unreachable`, with conditions that trigger `br_if`.    - **Constraint Checked:** Verifies if subsequent `br_if` instructions can bypass the trap incorrectly or cause block exits to wrong nesting levels.    - **Relation to Mismanagement of Block Nesting:** Tests control flow integrity in the presence of nested blocks and conditional `br_if` beyond the `unreachable` trap.

(assert_invalid
  (module (func $test-unreachable-in-blocks-br_if
    (block
      (unreachable)
      (block
        (br_if 0 (i32.const 1))
        (block
          (br_if 1 (i32.const 1))
          (drop (i32.const 0))
        )
        (drop (i32.const 0))
      )
      (drop (i32.const 0))
    )
  ))
  "type mismatch"
)