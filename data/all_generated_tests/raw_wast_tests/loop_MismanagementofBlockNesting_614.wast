;; 5. **Loop Exit via Br Table with Non-existent Index**: Implement a loop that contains a `br_table` with indices that exceed the available loop labels. This is to test how the default branch targets are handled, ensuring that error handling catches improper exits from nested loops correctly.

(assert_invalid
  (module (func $br_table-index-out-of-bounds
    (loop (result i32)
      (block
        (br_table 1 2 3 (i32.const 0))
      )
    )
  ))
  "br_table index out of bounds"
)