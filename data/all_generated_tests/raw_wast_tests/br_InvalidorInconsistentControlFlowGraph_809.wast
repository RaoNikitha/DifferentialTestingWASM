;; 10. **Polymorphic Operand Type Checking Test:**    Define a block structure where the types of operands before and after a `br` instruction differ. This tests if the implementation adheres to stack-polymorphic behavior while ensuring operand type consistency post-branching.

(assert_invalid
  (module
    (func $polymorphic-operand-type-check
      (block
        (block (result i32)
          (i32.const 42)
          (br 0)
        )
        (i32.eqz)
        (drop)
      )
    )
  )
  "type mismatch"
)