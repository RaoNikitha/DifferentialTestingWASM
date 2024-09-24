;; 3. Use a `br_table` instruction with an index larger than the largest possible target index to verify the behavior when the index exceeds bounds. This is critical for checking out-of-bounds index handling.

(assert_invalid
  (module (func $br_table_out_of_bounds
    (block
      (br_table 1 0 (i32.const 2))
    ))
  )
  "index out of bounds"
)