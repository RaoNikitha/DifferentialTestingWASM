;; 7. **Test Description**: Create a `block` with a `br_table` wherein the index values de-reference double indirect targets, involving indirection layers. This ensures correct multi-level dereferencing without exceeding the valid range.    - **Constraint Checked**: Correct multi-layer dereferencing and indexing checks in `br_table`.

(assert_invalid
 (module
  (func $double-indirection
   (block (result i32)
    (i32.const 1)
    (block (result i32)
     (block (result i32)
      (br_table 1 0 (i32.const 0))
     )
    )
   )
  )
 )
 "type mismatch"
)