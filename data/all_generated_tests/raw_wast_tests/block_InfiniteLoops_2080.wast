;; 1. Test a `block` instruction with a nested `loop` and `br_if` where the condition always evaluates to false, causing an infinite loop because the block doesn't transition the stack state correctly in wizard_engine.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (i32.const 1)
          (br_if 0 (i32.const 0))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)