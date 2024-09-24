;; 3. **Test Description**: Populate a function table with closely aligned but distinct function signatures. Perform `call_indirect` with an index that points to a function whose signature closely matches the expected type but includes an additional parameter. Check for incorrect branch target handling and proper trapping.

(assert_invalid
  (module
    (type $expected_sig (func (param i32)))
    (type $mismatch_sig (func (param i32 i32)))
    (func $func1 (param i32))
    (func $func2 (param i32 i32))
    (table funcref (elem $func1 $func2))
    (func $test_func
      (i32.const 1)
      (call_indirect (type $expected_sig) (i32.const 1))
    )
  )
  "type mismatch"
)