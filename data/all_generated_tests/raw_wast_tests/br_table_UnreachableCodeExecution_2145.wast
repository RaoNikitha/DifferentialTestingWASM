;; Involve a backward branch in the `br_table` where operands do not match the expected input of the target block and should direct control flow to an `unreachable` instruction. This test checks the robustness of backward branch targeting and operand matching against the type expectations.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (param i32) (result i32)
          (br_table 0 1 (i32.const 1) (i64.const 0))
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)