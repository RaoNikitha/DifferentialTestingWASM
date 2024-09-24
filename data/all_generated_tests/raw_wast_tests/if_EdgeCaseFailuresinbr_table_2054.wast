;; 5. **Conditional `br_table` with Edge Index**:    - Formulate a test where the `br_table` inside an `if` block uses an index equal to the maximum valid value (last valid label). Ensure the wizard engine's explicit reset doesn’t accidentally clear necessary state used by the `br_table`.

(assert_invalid
  (module
    (func $conditional_br_table_edge_index
      (block (block (block
        (i32.const 0)
        (if (result i32) (i32.const 1)
          (then (i32.const 0) (br_table 0 1 2))
          (else (i32.const 2))
        )
      )))
    )
  )
  "unexpected end"
)