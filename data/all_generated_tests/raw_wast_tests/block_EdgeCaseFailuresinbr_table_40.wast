;; 1. **Test Description**: Create a `block` containing a `br_table` that explicitly targets more labels than exist within the block. This will verify if each implementation correctly throws an out-of-bounds error when the jump index exceeds the number of defined labels.    - **Constraint Checked**: Proper error handling of index out-of-bounds for `br_table`.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (br_table 0 1 2 (i32.const 0))
      )
    )
  )
  "index out-of-bounds"
)