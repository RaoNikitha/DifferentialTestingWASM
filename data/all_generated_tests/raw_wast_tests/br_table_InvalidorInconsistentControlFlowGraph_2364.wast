;; 4. **Test for Incorrect Default Label Usage:**    - **Description:** Define a `br_table` instruction within a block where the operand correctly refers to a valid index in the vector, but ensure the implementation should validate this via the default label due to a CFG handling error.    - **Constraint Checked:** Ensuring implementations correctly compute the CFG and target the appropriate index rather than mistakenly falling to the default.

(assert_invalid
  (module
    (func $incorrect-default-label-usage
      (block
        (i32.const 0)
        (br_table 1 0 (i32.const 1))
      )
    )
  )
  "unknown label"
)