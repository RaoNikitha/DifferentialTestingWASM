;; 1. **Basic Nested Loop with Branching**:    Test a simple nested `loop` structure with an inner `loop` that branches to an outer `loop` using `br` instruction. This checks correct indexing and execution flow when nested loops are involved. Ensure each branch correctly refers to its respective loop label, verifying proper label stacking and context management.

(assert_invalid
  (module
    (func (loop (result i32)
      (block
        (loop (result i32)
          (br 1)
          (i32.const 0)
        )
        (i32.const 1)
      )
    ))
  )
  "type mismatch"
)