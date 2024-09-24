;; Develop a block with multiple `br` instructions and insert stack manipulation operations (like `drop` and `select`) between them. The test verifies if the operand stack state matches the expected state at each branch target.

(assert_invalid
  (module
    (func $test_block
      (block (result i32)
        (i32.const 42)
        (br 0 (i32.const 99))
        (drop)
        (i32.const 101)
        (select (i32.const 1) (i32.const 2) (i32.const 0))
      )
    )
  )
  "type mismatch"
)