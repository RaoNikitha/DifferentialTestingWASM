;; 7. **Test Description**: Use `call_indirect` within nested blocks where a `br_table` immediately follows another `br_table` that exits the inner block, to verify correct flow control between nested break table instructions.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (type $sig_1 (func (param i32) (result i32)))
    (func $f (param i32) (result i32)
      i32.const 42)
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func
      (block (result i32)
        (block (result i32)
          i32.const 0
          (call_indirect (type $sig) (i32.const 0))
          (br_table 0 1 (i32.const 1))
        )
        (br_table 0 (i32.const 1))
      )
      drop
    )
  )
  "type mismatch"
)