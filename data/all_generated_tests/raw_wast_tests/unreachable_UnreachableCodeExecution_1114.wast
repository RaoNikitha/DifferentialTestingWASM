;; 5. Create a function that computes values and uses `br_table` to jump to different blocks, including one block that contains an `unreachable` instruction. Verify if the trap occurs when the table index leads to the `unreachable` block.

(assert_invalid
  (module
    (func $test
        (block
            (block $exit
                (block $unreachable_block
                    (unreachable)
                )
                (br_table $unreachable_block $exit (i32.const 0))
                (i32.const 42)
            )
        )
    )
  )
  "type mismatch"
)