;; 8. **Test Description**: A test with multi-level nested loops where `call_indirect` is inside the innermost loop, followed by a `br_table` that attempts a complicated jump pattern covering multiple nested depths, testing stacking handling.

(assert_invalid
  (module
    (type $t0 (func (param i32) (result i32)))
    (type $t1 (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f0)
    (func $f0 (type $t0) (param i32) (result i32)
      (i32.const 0)
    )
    (func $nested-loops
      (block $B0
        (loop $L0
          (loop $L1
            (call_indirect (type $t0) (i32.const 0) (i32.const 1))
            (br_table $B0 $L0 $L1 (i32.const 2))
          )
        )
      )
    )
  )
  "type mismatch"
)