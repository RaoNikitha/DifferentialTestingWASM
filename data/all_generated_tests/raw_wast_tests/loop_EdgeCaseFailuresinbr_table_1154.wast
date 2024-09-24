;; 5. **Test Description**:    - Implement a nested `loop` structure with `br_table`, targeting indices that are valid only within the inner loop and invalid in the outer loop.    - **Constraint**: Ensures correct scoping and context-specific index handling.    - **Edge Case**: Detects misinterpretation of label scope rules.

(assert_invalid
  (module
    (func $nested-loop-br-table
      (loop $outer-loop
        (loop $inner-loop
          (block (br_table 1 0) (nop))
        )
      )
    )
  )
  "label index out of range"
)