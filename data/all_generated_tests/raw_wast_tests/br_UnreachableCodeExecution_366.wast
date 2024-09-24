;; 7. **Test Description:** Implement nested blocks with misaligned operand types. Insert an `unreachable` after a `br` instruction to observe if incorrect types lead to unexpected control flow.     - **Constraint Checked:** Operand type conformity between branch points.     - **Relation to Unreachable Code Execution:** Ensures that operand type mismatches do not lead to reaching an `unreachable`.

(assert_invalid
  (module
    (func $nested-misaligned-operands
      (block (result i32)
        (block (result i32)
          (i32.const 10)
          (br 1)
          (unreachable)
        )
        (i64.const 20)
      )
    )
  )
  "type mismatch"
)