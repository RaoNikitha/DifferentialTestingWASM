;; Test 8: Execute a `br_table` instruction when the operand stack undergoes significant state changes due to preceding instructions. Ensure the instruction correctly indexes the label vector with the current operand value from the stack.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (i32.const 5)
          (i32.const 10)
          (i32.add)
          (local.get 0)
          (i32.const 2)
          (i32.sub)
          (br_table 0 1 2 (i32.const 3) (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)