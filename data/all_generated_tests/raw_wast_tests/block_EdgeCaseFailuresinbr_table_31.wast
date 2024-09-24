;; 2. Test Description: Implement a `block` with nested blocks, each containing a `br_table` targeting more depth levels than available. This tests whether both implementations correctly calculate and validate label indices within nested contexts or mistakenly allow invalid jumps.

(assert_invalid
  (module
    (func $nested-br_table (result i32)
      (block $outer (result i32)
        (block $inner
          (br_table 0 1 2 (i32.const 0))
        )
        (i32.const 0)
      )
    )
  )
  "invalid br_table"
)