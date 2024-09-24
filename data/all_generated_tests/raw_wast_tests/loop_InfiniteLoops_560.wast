;; 1. **Test Name: Simple Infinite Loop Test**    - **Description**: Create a simple loop with no branching instruction inside. The loop contains a single `br` instruction targeting itself, causing an infinite backward jump.    - **Constraint Checked**: Proper handling and validation of backward jumps within a loop.    - **Infinite Loop Relation**: The loop will never terminate due to the continuous backward jump.

(assert_invalid
  (module
    (func $infinite_loop
      (loop (blocktype (result i32))
        (br 0)
      )
    )
  )
  "infinite loop with backward jump"
)