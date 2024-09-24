;; A `block` that initiates with certain values on the stack, performs a series of `br_table` instructions to jump to various points within the block, and checks if the stack remains consistent and matches the required result type.

(assert_invalid
  (module (func $type-br-table-stack-mismatch
    (block (result i32)
      i32.const 10
      i32.const 20
      br_table 0 0 0
      i32.const 30
      br 0
    )
  ))
  "type mismatch"
)