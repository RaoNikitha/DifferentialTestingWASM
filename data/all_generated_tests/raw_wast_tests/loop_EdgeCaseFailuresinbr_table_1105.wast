;; 6. **Test Six**:    - A deeply nested `loop` structure with `br_table` targeting various loop depths, including an index that is out-of-bounds (> total loops).    - **Constraint**: Ensures proper resolution of loop label indices and context integrity.    - **Relation**: Examines label indexing and loop identification logic when resolving branches.

(assert_invalid
  (module
    (func $deep-loop-br_table
      (loop (result i32)
        (loop (result i32)
          (loop (result i32)
            (br_table 0 1 2 3 (i32.const 4))
          )
        )
      )
    )
  )
  "invalid label index"
)