;; 5. Implement a `br_table` that leads to a destination within an inner block followed by an `unreachable` instruction, probing if jumping to an inner scope which then needs to execute `unreachable` correctly traps the execution.

(assert_invalid
  (module
    (func $test_br_table_inner_block_unreachable
      (block
        (br_table 0 0 0 (i32.const 0))
        (unreachable)
      )
    )
  )
  "type mismatch"
)