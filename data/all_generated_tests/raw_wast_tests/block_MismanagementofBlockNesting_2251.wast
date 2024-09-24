;; 2. **Test Description**: Use a `block` containing an inner block that itself contains nested `loop` structures, with a `br_table` in the inner loop. This tests branching targets relative to nested blocks and loops.    - **Constraint**: Validate the handling of `br_table` within multiple nested control structure hierarchies.    - **Nesting Mismanagement Check**: Tests if the correct block or loop label is targeted when using `br_table`.

(assert_invalid
 (module
  (func $block-with-incorrect-br_table
   (block (result i32)
    (block (result i32)
     (loop (result i32)
      (block (result i32)
       (br_table 1 2 0 (i32.const 0))
      )
     )
    )
   )
  )
 )
 "type mismatch"
)