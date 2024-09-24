;; 6. **Test Description**: Construct a complex module with multiple functions and indirect calls where each call chooses a subsequent function to call conditionally based on states determined within a `loop`. Evaluate if erroneous type resolutions or table index mismanaging in one implementation leads to unintentional infinite looping.

(assert_invalid
  (module
    (type $t1 (func (param i32)))
    (type $t2 (func (param i64)))
    (func $func1 (param i32))
    (func $func2 (type $t2))
    (table funcref (elem $func1 $func2))
    (func $main
      (i32.const 0)
      (call_indirect (type $t1) (i32.const 0))
      (loop
        (i32.const 1)
        (call_indirect (type $t2) (i32.const 1))
      )
    )
  )
  "type mismatch"
)