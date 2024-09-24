;; 8. A `br_table` with an index operand that is valid but the subsequent block is not properly terminated, leading to possible undefined behavior. This tests if the implementations properly verify block terminations after indirect branching.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $br_table_with_invalid_block
      (block
        (call_indirect (type 0) (i32.const 0))
        (br_table 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)