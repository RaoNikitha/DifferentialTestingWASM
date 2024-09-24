;; 3. **Out-of-Bounds Table Index**:    - Test a `call_indirect` with an index exceeding the defined table size, ensuring the trap occurs properly.    - This test ensures boundary checks for operand indices are rigorously enforced.    - It relates to `br_table` as both instructions must correctly handle out-of-bounds indexing.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $f (param i32) (result i32) (i32.const 0))
    (elem (i32.const 0) $f)
    (func $test
      (i32.const 1)
      (call_indirect (type $sig) (i32.const 2))
    )
  )
  "out of bounds table index"
)