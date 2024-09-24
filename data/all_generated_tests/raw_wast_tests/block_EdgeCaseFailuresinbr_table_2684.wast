;; 5. **Interleaved Upper Bound Indices**:    - Create a block with multiple `br_table` instructions mixed with regular instructions, and ensure some indices hit the upper limit of the target lists. Check the implementation’s behavior on boundary conditions throughout execution.    - **Constraint Checked**: Index boundary condition handling amidst regular instructions.

(assert_invalid
  (module (func $interleaved-upper-bound-indices
    (block (result i32)
      i32.const 0
      br_table 0 0 1
      i32.const 1
      br_table 0 1 2
      i32.const 2
      br_table 1 2 3
      i32.const 3
      br 4
      i32.const 4
    )
  ))
  "index out of bounds"
)