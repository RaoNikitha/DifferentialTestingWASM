;; 4. Develop a test where the `br_table` targets labels containing valid instructions and one incorrectly points to an `unreachable` instruction. The operand should index correctly to valid instructions, but edge cases should reveal if the `unreachable` gets executed due to mishandling the labels.

(assert_invalid
  (module
    (func $unreachable-targets
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_table 0 1 2 (i32.const 1) (unreachable))
          )
          (i32.const 42)
        )
        (i32.const 24)
      )
    )
  )
  "expected unreachable"
)