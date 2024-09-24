;; 1. Test a function with nested blocks, where the `return` instruction is executed inside an inner block. Verify that the operands added inside the inner block do not corrupt the operand stack of the outermost block. This checks whether the `return` instruction properly unwinds the stack up to the outermost block without leaving any dangling values.

(assert_invalid
  (module
    (func $nested-block-return (result i32)
      (block
        (block
          (i32.const 42)
          (return)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)