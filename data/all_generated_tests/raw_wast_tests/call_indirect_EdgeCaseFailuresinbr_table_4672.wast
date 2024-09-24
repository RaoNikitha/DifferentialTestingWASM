;; 1. A test where the index operand for `br_table` exceeds the number of defined labels. This will check if the implementations correctly handle out-of-bounds table indexing and produce a trap.

(assert_invalid
  (module
    (type $t1 (func (param i32) (result i32)))
    (type $t2 (func (param i32)))
    (func $f (type $t1) (param i32) (result i32)
      local.get 0
    )
    (table 10 funcref)
    (elem (i32.const 0) $f)
    (func (export "test")
      (i32.const 0)
      (call_indirect (type $t2) (i32.const 12))  ;; beyond table limit
    )
  )
  "out of bounds table index"
)