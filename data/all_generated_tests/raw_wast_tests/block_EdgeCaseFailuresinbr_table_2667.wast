;; Use `br_table` inside a block which targets a mix of valid and invalid indices, intermixed with valid block instructions. This complex branching tests if the implementations sort out valid from invalid targets and respect type rules throughout.

(assert_invalid
  (module (func $br_table_mismatch_type (result i32)
    (block (result i32)
      (block f64 (i32.const 0) (br_table 0 1 (i32.const 1)))
      (i32.const 1)
    )
  ))
  "type mismatch"
)