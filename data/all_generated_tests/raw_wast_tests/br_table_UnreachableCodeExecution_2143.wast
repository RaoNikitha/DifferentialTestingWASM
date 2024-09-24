;; Construct a `br_table` instruction with mismatched operand types that end up causing a control flow to an `unreachable` instruction within one of the blocks. This test examines if the immediate type requirements and stack state handling are correctly enforced.

(assert_invalid
  (module (func $mismatched-types-unreachable
    (block (result i32)
      (block (result f32)
        (br_table 0 1 (i32.const 0) (i32.const 0))
        (unreachable)
      )
    )
  ))
  "type mismatch"
)