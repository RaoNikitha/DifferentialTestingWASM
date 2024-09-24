;; 8. Use a `br_table` instruction in deeply nested blocks with varied indices to assess its ability to correctly map indices to labels in complex nesting. This focuses on accurate relative label resolution in nested structures.

(assert_invalid
  (module (func 
    (block (block (block (block 
      (br_table 0 1 2 3 (i32.const 1))
    ))))
  ))
  "unknown label"
)