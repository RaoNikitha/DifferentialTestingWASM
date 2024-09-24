;; A test where a block is nested inside another block, with a `br_table` that should only exit the inner block while retaining control of the outer block. This verifies correct branching behavior and label indexing.

(assert_invalid
  (module (func $nested-blocks-br-table (result i32)
    (block (result i32)
      (block (result i32)
        (i32.const 1)
        (i32.const 0)
        (br_table 0 1)
      )
      (i32.const 2)
    )
  ))
  "type mismatch"
)