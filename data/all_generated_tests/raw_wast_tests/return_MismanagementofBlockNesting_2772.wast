;; 1. **Test Description:**    - Create a function with a deeply nested block structure, where an inner block contains a `return` instruction.    - Ensure there are intermediate values pushed onto the stack before the return instruction.    - The test checks if the return instruction correctly unwinds the stack and exits from the function rather than an intermediate block.    - **Specific Constraint:** Mismanagement of operand stack unwinding within nested blocks.

(assert_invalid
  (module
    (func $deep-nested-block-unwind (result i32)
      (i32.const 1)  ;; Intermediate value before the return
      (block
        (block
          (block
            (return)
          )
          (i32.const 2)
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)