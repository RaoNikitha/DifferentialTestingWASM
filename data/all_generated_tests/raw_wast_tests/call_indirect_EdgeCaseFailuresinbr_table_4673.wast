;; 2. A `br_table` instruction with no labels provided. This will test if the implementations correctly trap due to an invalid usage scenario with no valid branches.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 0 funcref)
    (func $br-table-no-label (br_table (i32.const 0) (call_indirect (type 0) (i32.const 0))))
  )
  "type mismatch"
)