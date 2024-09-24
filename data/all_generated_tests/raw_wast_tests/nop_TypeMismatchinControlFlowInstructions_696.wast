;; 7. **Stack State Consistency within Labels**:    - Establish a labeled block, place a `nop`, and then follow up with an operation that switches the type under the label.    - Validates label type maintenance with intermediate `nop` instruction.    - **Reasoning**: Checks type consistency with labeled instruction blocks.

(assert_invalid
  (module 
    (func $test 
      (block $label
        (nop)
        (i32.const 1)
        (f32.const 2.0)
      )
    )
  )
  "type mismatch"
)