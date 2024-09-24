;; Test 4: Create a `br_table` instruction with target labels requiring different types and counts of operands. Validate the consistency of operand types on the stack before and after each branch, especially focusing on backward branches that need correct operand consumption.

(assert_invalid
  (module
    (func (param i32 i64) (result i32)
      (block (result i32)
        (br_table 0 (local.get 1) (local.get 0))
      )
    )
  )
  "type mismatch"
)