;; - Provide a `br_table` instruction with all labels being `loop` structures, and validate if it performs backward jumps correctly for valid indices.

(assert_invalid
  (module
    (func (param i32)
      (block (loop (br_table 0 0 0 (i32.const 1) (local.get 0))))
    )
  )
  "type mismatch"
)