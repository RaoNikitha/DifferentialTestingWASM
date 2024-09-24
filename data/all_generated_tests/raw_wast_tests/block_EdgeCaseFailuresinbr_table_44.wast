;; 5. **Test Description**: Use a `br_table` instruction within a `block` where the input table dynamically exceeds allocated bounds during execution. This will test bounds-checking mechanisms in real-time while managing dynamic branching.    - **Constraint Checked**: Runtime bounds-checking for dynamically evaluated `br_table` indices.

(assert_invalid
 (module
  (func $br_table-bounds-check (result i32)
   (block (result i32)
    (i32.const 0)
    (br_table 0 0 (i32.const 3)) ; This dynamically exceeds the bounds
   )
   (i32.const 1)
  )
 )
 "out of bounds br_table index"
)