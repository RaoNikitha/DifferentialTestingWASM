;; 5. **Crossing Structured Control Instruction Boundaries Unlawfully:**    - Create test cases where a `br` attempts to jump between adjacent control instructions instead of nested ones.    - **Constraint Checked:** Structured control flow compliance.    - **CFG Impact:** Invalid jumps create CFG inconsistencies by breaking out of structured instruction boundaries unlawfully.

(assert_invalid
  (module (func $cross-structure-boundary
    (block
      (block
        (br 1)  ;; illegal jump, br should target nested structures
      )
    )
  ))
  "unknown label"
)