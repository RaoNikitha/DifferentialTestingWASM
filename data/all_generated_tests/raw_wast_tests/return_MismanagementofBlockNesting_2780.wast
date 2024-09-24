;; 9. **Test Description:**    - Develop a function using nested labeled blocks, where an inner block has a `return` instruction.    - Labels should be defined to verify if the `return` correctly exits the overall function context and not a labeled block.    - **Specific Constraint:** Mismanagement of labeled block interpretation and correct return execution.

(assert_invalid
  (module
    (func $nested-labels-mismanaged-return (result i32)
      (i32.const 0)
      (block $outer
        (block $inner
          (return)
        )
        (unreachable)
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)