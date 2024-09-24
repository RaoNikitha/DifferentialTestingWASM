;; 1. **Test Description:**    - Create a WebAssembly module containing a nested `block` structure, where the inner `block` expects an integer but receives a float due to a `br` instruction branching from an outer block.    - **Constraint Check:** This test validates that the type consistency is maintained across branches, ensuring the operand stack's types match the expected result type of the `block` being branched to.    - **Differential Behavior:** WebAssembly should catch and throw a type error, while Wizard Engine might incorrectly allow the operation due to its verbose label lookup potentially missing this type mismatch.

(assert_invalid
  (module
    (func (block (result i32)
      (block (result f32)
        (br 1 (f32.const 1.0))
      )
    ))
  )
  "type mismatch"
)