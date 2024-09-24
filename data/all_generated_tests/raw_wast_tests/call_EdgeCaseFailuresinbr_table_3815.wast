;; 4. **Test Description**: Have a `br_table` instruction where the default branch itself leads to another `br_table` with a similarly out-of-bounds index. This checks for consistent handling of nested table lookups and ensuring correct propagation of default behavior.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $test
      (block $outer
        (block $inner
          (br_table $inner $outer (i32.const 10))  
          (br_table $inner $outer (i32.const 20))
        )
      )
    )
  )
  "undefined label"
)