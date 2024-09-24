;; Test 2: Design a scenario where a `br_if` instruction conditionally breaks out of a nested `loop` back to an enclosing `block`. Ensure the operand stack is correctly unwound and values are appropriately restored.

(assert_invalid
  (module
    (func $loop_unwind_value_check
      (block
        (loop
          (i32.const 1)
          (br_if 0 (i32.const 0))
          (i32.const 2)
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)