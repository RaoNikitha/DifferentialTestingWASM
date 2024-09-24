;; 6. Test Description 6: Generate a test where the `br_table` instruction inside a block targets labels that expect varying operand types with lengths different from the operand stack configuration.

(assert_invalid
  (module
    (func
      (block
        (i32.const 0) (i64.const 1)
        (br_table 1 2 (i32.const 2))
      )
    )
  )
  "type mismatch"
)