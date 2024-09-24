;; 3. **Excessive Nesting Depth**:    - **Description**: Create deeply nested blocks and use `br_if` with a label index that exceeds the actual nesting depth by one. This should be flagged by wizard_engine due to bounds checking.    - **Constraint**: Nesting depth validation.    - **CFG Impact**: Introduces unresolvable branches, leading to an incorrect control flow graph.

(assert_invalid
  (module
    (func $excessive-nesting-depth
      (block
        (block
          (block
            (br_if 3 (i32.const 1))
          )
        )
      )
    )
  )
  "invalid label"
)