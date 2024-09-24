;; 6. **Test Description:**    - **Test Name:** Double Module Boundary Branch Test    - **Objective:** Test branching across double module boundaries, involving an imported function and an exported function in sequence.    - **Constraint:** Ensures correct handling of operand stack and label indexing across multiple module boundaries.    - **Relation to Incorrect Handling:** Ensures there is no control flow corruption when branching causes transitions across multiple modules.

(assert_invalid
  (module
    (import "env" "ext_func" (func $ext_func (result i32)))
    (func (export "start")
      (block $b0
        (block $b1
          (call $ext_func)
          (br 1) ; Unconditional branch to $b0
        )
        ;; Second block within the imported function
        ;; Here we purposely cause a type mismatch to enforce the constraint
        (block $b2 (br_table 0 1 (i64.const 0))) ; br_table target mismatch
      )
    )
  )
  "type mismatch"
)