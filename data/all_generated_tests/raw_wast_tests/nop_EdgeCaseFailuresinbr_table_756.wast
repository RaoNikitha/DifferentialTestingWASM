;; 7. Nest a `nop` inside a block that concludes with a `br_table` where the index is derived from dynamic computation to ensure both implementations can handle runtime index evaluations without the `nop` affecting the outcome.

(assert_invalid
  (module
    (func $block_with_br_table
      (local $index i32)
      (block
        (nop)
        (i32.const 10)
        (set_local $index)
        (br_table 0 1 (get_local $index))
      )
    )
  )
  "type mismatch"
)