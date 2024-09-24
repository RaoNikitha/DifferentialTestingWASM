;; 6. **Test Description:**    - Define a complex `block` structure where the innermost block expects `f64`.    - Use a `br_table` to conditionally branch to several labels, with one specific branch incorrectly exiting with an `i32`.    - It tests the type constraints across multiple conditional branches within nested structures.

(assert_invalid
  (module
    (func $complex-br-table-type-mismatch
      (block $outer
        (block $inner1 (result f64)
          (br_table 0 1 (i32.const 0))
        )
        (block $inner2 (result f64)
          (f64.const 0.0)
          (br_table 0 1 2 (i32.const 1)) ; Incorrect branch to $outer with i32 type
        )
      )
    )
  )
  "type mismatch"
)