;; 10. **Complex Branching in Mixed Control Flows**:    - **Description**: Inside a mix of nested blocks, ifs, and loops, perform several `br_if` instructions that attempt to branch to various depths and types of control structures. This tests overall management of nested contexts.    - **Constraint Checked**: Execution Context, Relative Label Lookup.    - **Expected Failure**: wizard_engine could fail to respect the correct contextual depth and type consistency in complex nested branches, resulting in possible `OobLabel` errors.

(assert_invalid
  (module
    (func $complex-branching-mixed-control (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (loop (result i32)
            (if (result i32) (i32.eq (local.get 0) (i32.const 0))
              (then
                (br_if 2 (i32.const 1)) 
              )
              (else
                (block (result i32)
                  (br_if 0 (i32.const 1))
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)