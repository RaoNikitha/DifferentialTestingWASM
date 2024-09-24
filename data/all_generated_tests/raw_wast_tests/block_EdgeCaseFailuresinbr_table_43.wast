;; 4. **Test Description**: Form a `block` with a `br_table` instruction where some possible indices correspond to invalid instructions or missing labels. Verify that each implementation throws an appropriate error for such invalid jumps.    - **Constraint Checked**: Handling of invalid jump targets due to erroneous `br_table` indices.

(assert_invalid
  (module 
    (func (result i32)
      (block (result i32) 
        (i32.const 0) 
        (br_table 0 1 2)
      )
    )
  )
  "invalid jump target"
)