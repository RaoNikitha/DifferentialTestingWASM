;; 3. **Test Invalid Branch to Outer Block**:    - Description: Use a branch instruction (`br`, `br_if`) inside a block to point to an invalid outer block index.    - Constraint: Ensure the implementation correctly identifies invalid branch targets.    - CFG Relevance: Incorrectly handled label indexing can lead to invalid control flow paths.

(assert_invalid
  (module (func
    (block (result i32)
      (i32.const 0)
      (block (br 2))
    )
  ))
  "unknown label"
)