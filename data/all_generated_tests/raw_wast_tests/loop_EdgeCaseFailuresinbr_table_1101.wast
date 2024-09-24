;; 2. **Test Two**:    - A `br_table` with a negative index (encoded in WASM as an extremely large unsigned integer) with multiple nested `loop` blocks.    - **Constraint**: Ensures that invalid negative indices do not cause incorrect jumping into non-existent loop blocks.    - **Relation**: Tests the index validation logic and ensures negative values are correctly interpreted.

(assert_invalid
  (module
    (func $br_table_negative_index
      (block
        (loop $l1
          (loop $l2
            (br_table 0xFFFFFFFF $l1 $l2)
          )
        )
      )
    )
  )
  "invalid index"
)