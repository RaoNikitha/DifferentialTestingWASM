;; 6. Test Description: Design a `block` where a `br_table` instruction's target index points to an inner block that is already out of scope upon reaching. This tests whether both implementations maintain the correct scope validation and prevent invalid jumps.

(assert_invalid
  (module
    (func $br_table-out-of-scope (result i32)
      (block (result i32)
        (block
          (br_table 1 0 (i32.const 0))
          (i32.const 2)
        )
        (i32.const 1)
      )
    )
  )
  "out of scope"
)