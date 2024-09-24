;; 4. **Mismatched Input and Output Types in Blocktype**:    - Define an `if` block with `i32` as input type but the instructions inside the `then` or `else` block use `f32` instead.    - This ensures the input/output types within the blocks are in sync with the block type's declared types.    - **Constraint**: Validating the blocktype ensures correct input and output types are maintained.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (result i32) (local.get 0)
        (then (f32.const 1.0))
        (else (f32.const 2.0))
      )
    )
  )
  "type mismatch"
)