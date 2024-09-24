;; 7. **Test Description**: Create a block with a branch table (`br_table`) having an entry targeting an invalid depth. The WebAssembly method may falter due to improper state management across different branches.    - **Constraint Checked**: Correct branch table operations within a block structure.    - **Relation to CFG**: Misalignment in CFG due to incorrect branch target depth.

(assert_invalid
  (module (func $invalid-br_table-depth
    (block (result i32)
      (i32.const 0)
      (br_table 0 1 2)
    )
  ))
  "invalid depth"
)