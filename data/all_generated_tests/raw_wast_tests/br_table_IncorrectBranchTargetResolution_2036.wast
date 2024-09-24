;; 7. **Incompatible Default Target Type:**    - Provide a `br_table` where the default label index resolves to a block with an incompatible type sequence compared to label indices.    - *Testing for*: Consistency of operand types across default and target labels.    - *Constraint*: Type matching and consistency.

(assert_invalid
  (module
    (func (block (result i32)
      (block (result i64)
        (block (br_table 0 1 2 (i32.const 0)))
      )
    ))
  )
  "type mismatch"
)