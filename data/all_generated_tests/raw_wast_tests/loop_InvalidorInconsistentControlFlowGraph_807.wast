;; 8. **Test `br_table` Default Handling Error**:    - Implement a `loop` with a `br_table` instruction with out-of-bound indices and an incorrectly set default branch.    - **Constraint**: Correct handling of `br_table` defaults.    - **CFG Impact**: Mishandling out-of-bound branches can result in CFG paths leading to invalid destinations.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (i32.const 1)
          (br_table 0 1)
        )
      )
    )
  )
  "invalid branch depth"
)