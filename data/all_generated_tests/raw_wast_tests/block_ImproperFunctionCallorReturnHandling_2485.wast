;; Develop a block containing multiple `call_indirect` instructions where each indirect call has differently typed functions with a mixed valid/invalid index. This test should contrast how the different engines validate each indirect call's type and index consistency within the block.

(assert_invalid
  (module
    (type $t0 (func (param i32) (result i32)))
    (type $t1 (func (param f64) (result f64)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func (result i32)
      (block (result i32)
        (call_indirect (type $t0) (i32.const 0) (i32.const 10))
        (call_indirect (type $t1) (i32.const 1) (f64.const 10.0))
        (call_indirect (type $t0) (i32.const 2) (i32.const 20))
      )
    )
  )
  "type mismatch"
)