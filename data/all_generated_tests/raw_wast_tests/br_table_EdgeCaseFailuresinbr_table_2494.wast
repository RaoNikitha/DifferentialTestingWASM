;; 4. **Maximum Possible Index**:    Push the maximum possible `i32` value (2,147,483,647) onto the stack and execute the `br_table` instruction with a label vector of moderate size. This extreme value tests if the implementation can handle large out-of-bounds values gracefully by defaulting correctly.

(assert_invalid
  (module
    (func $max-index-br_table
      (block
        (br_table 0 1 2 (i32.const 2147483647))
      )
    )
  )
  "unknown label"
)