;; Formulate an `if` block where the `then` branch contains a valid `br_table`, but the `else` branch has a `br_table` with an out-of-range index that should be caught during validation but is treated differently in the two implementations.

(assert_invalid
  (module (func $br_table-if-differential
    (if (result i32) (i32.const 1)
      (then 
        (block $blk0 
          (br_table $blk0 $blk0 (i32.const 0))
        )
        (i32.const 42)
      )
      (else 
        (block $blk1 
          (br_table $blk1 $blk1 (i32.const 2)) ;; Out-of-range index
        )
        (i32.const 42)
      )
    )
  ))
  "unknown label"
)