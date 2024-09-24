;; 4. Construct a module with a function that calls an out-of-bounds index via `call_indirect`. Confirm that a trap occurs and the appropriate error is raised in both implementations.

(assert_invalid
  (module
    (type $funcType (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $outOfBoundsFunc)
    (func (call_indirect (type $funcType) (i32.const 1)))
    (func $outOfBoundsFunc (param i32))
  )
  "undefined element"
)