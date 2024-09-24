;; 4. **Test Description:**     A `br_table` instruction placed inside nested blocks with varying depths, combined with `unreachable` in the outermost block, to test how inner block indices are managed along with trapping.    **Constraint Checked:** Examines how nested control structures and deep indexing in `br_table` interact with the `unreachable` instruction.    **Edge Case Relation:** Ensures deep nesting and complex paths through `br_table` handle `unreachable` correctly.

(assert_invalid
  (module (func $test-br_table-unreachable
    (block 
      (block 
        (block
          (br_table 0 1 2 (i32.const 0))
        )
        (unreachable)
      )
    )
  ))
  "type mismatch"
)