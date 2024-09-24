;; 4. Create a scenario where `call_indirect` indexes an empty table for `br_table`, expecting a trap due to the invalid index.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "undefined element"
)