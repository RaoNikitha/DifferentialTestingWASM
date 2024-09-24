;; 2. **Out of Bounds Index Resolution:**    - Use `br_table` with an operand that points to a label index outside the provided label vector range. The implementation should correctly resolve to the default label.    - *Testing for*: Correct handling of out-of-bounds label indices.    - *Constraint*: Operand and indexing correctness.

(assert_invalid
  (module (func $out-of-bounds-label
    (block
      (br_table 0 1 2 (i32.const 3))
    )
  ))
  "unknown label"
)