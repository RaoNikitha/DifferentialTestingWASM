;; 6. **Forward Branches with Mismatched Output Types:**    - **Test Description:** Design a block with specific output types, then forward branch using `br` with operand types that do not match the expected output types of the targeted block.    - **Constraint Tested:** Forward branch operand type conformance.    - **CFG Relevance:** Incorrect forward branch types can result in invalid paths in the CFG, as the flow resumes with unexpected stack states.

(assert_invalid
  (module
    (func $forward-branch-mismatch-output-types
      (block (result i32)
        (br 0 (i64.const 0)) (i32.const 1)
      )
    )
  )
  "type mismatch"
)