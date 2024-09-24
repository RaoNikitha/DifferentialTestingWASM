;; 6. **Test Description**: Construct a `br_table` where the target labels include nested `block` and `loop` constructions, and the indices include boundaries and an out-of-bounds index.    - **Constraint**: Checks correct handling and branching within nested structures when boundary and out-of-bounds indices are involved.    - **Edge Case Relation**: Challenges the implementation's nested structure management amid invalid indices.

(assert_invalid
  (module
    (func $nested-br-table
      (block
        (loop
          (br_table 0 1 2 (i32.const 3))
        )
      )
    )
  )
  "unknown label"
)