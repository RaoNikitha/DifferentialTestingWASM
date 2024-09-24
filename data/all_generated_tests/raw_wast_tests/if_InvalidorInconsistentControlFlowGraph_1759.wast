;; 10. **Test `if` Block with Invalid Label Indexing**:    - Include branches within an `if` block that reference non-existent or out-of-bound labels, ensuring the CFG correctly identifies and flags invalid label references.    - **Constraint Checked**: confirms CFG manages label indexing appropriately and flags invalid references.

(assert_invalid
  (module
    (func $invalid-label-index
      (if (i32.const 1)
        (then (br 1)) (else (nop))
      )
    )
  )
  "unknown label"
)