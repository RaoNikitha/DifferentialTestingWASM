;; 8. **Test Return with Multiple Arguments**:    - Develop a function returning multiple values by directly manipulating the stack before the `return` instruction. Validate both implementations for their ability to correctly match the function's return type without leaving residual values on the stack.

(assert_invalid
  (module
    (func $return-multiple-values-unwind-stack (param i32 i32) (result i32 i32)
      (i32.const 10)
      (i32.const 20)
      (i32.const 30)
      (return (i32.const 40) (i32.const 50))
    )
  )
  "type mismatch"
)