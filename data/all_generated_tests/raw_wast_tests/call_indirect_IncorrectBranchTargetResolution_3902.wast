;; 1. **Test Case 1**:    - **Description**: Create a module where `call_indirect` targets a table index that refers to a function with a correct type but places it within a nested block scope. Set a `br` instruction to label zero in the outer block, ensuring that the correct function is called without early exiting the block.    - **Constraint Checked**: Validations of proper label resolution within nested blocks.    - **Incorrect Branch Target Resolution**: Ensures that the `br` instruction does not falsely break out of the outer block due to incorrect label resolution.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func (result i32)
      (block
        (block
          (call_indirect (type 0) (i32.const 0))
          (br 0)
        )
      )
    )
  )
  "invalid branch target"
)