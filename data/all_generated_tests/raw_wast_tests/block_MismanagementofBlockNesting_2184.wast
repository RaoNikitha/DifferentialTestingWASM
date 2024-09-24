;; 5. **Nested Blocks with Variations in Block Types**:    - Design nested blocks with different block types (`valtype?` and `typeidx`). Ensure `blocktype` interpretations respect the type constraints when branching between these blocks. Mismanagement may result in incorrect stack manipulations or block exits violating type constraints.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result f64)
          (br 1 (i32.const 0))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)