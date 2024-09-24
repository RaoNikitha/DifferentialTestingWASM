;; Test a `block` with a `br_if` (conditional branch) that leaves the stack in an unexpected state when the condition is false, leading to a type mismatch at the `return` instruction.

(assert_invalid
  (module
    (func $block-unexpected-state (result i32)
      (block
        (i32.const 1)
        (i32.const 2)
        (br_if 0 (i32.const 0))
        (return (i32.const 3))
      )
    )
  )
  "type mismatch"
)