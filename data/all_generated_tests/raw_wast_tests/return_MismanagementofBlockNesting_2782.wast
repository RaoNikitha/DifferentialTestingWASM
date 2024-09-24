;; Test 1: Create a function with deeply nested blocks, where a `return` instruction is placed in the innermost block. Ensure that the function has multiple different values added to the operand stack within different nested blocks. Verify that `return` correctly unwinds to the outermost block's expected operand stack state.

(assert_invalid
  (module
    (func $deeply_nested_blocks (result i32)
      (i32.const 1)
      (block
        (i32.const 2)
        (block
          (i32.const 3)
          (block
            (return)
            (i32.const 4)
          )
          (i32.const 5)
        )
        (i32.const 6)
      )
      (i32.const 7)
    )
  )
  "type mismatch"
)