;; 4. **Multiple Nested Loops with Cross-branching**:    - Create nested loops where an inner loop contains `br` instructions targeting an outer loop. Ensure context updates correctly manage nested control flows.    - **Constraint**: Each nested loop must maintain independent labels.    - **CFG Check**: Verify correct mapping and nesting of labels in the CFG.

(assert_invalid
  (module
    (func (result i32)
      (loop $outer (result i32)
        (loop $inner (result i32)
          (br $outer)
        )
      )
    )
  )
  "multi-nested loops with incorrect branching"
)