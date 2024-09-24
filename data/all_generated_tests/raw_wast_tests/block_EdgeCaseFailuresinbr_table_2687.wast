;; 8. **Function Call Preceding `br_table`**:    - Design a block that includes function calls before the `br_table`, checking if stack operations affected by function calls are correctly managed when reaching a `br_table` instruction.    - **Constraint Checked**: Stack state preservation prior to `br_table` execution.

(assert_invalid
  (module (func $func-call-before-br-table
    (block $outer (result i32)
      (block $inner
        (call $someFunc)
        (br_table 0 1 (i32.const 0))
      )
    )
  ))
  "unresolved call"
)

(func $someFunc (nop))
)