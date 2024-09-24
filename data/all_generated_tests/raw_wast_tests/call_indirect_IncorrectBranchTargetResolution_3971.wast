;; 10. **Test Description**: Arrange a function table with mixed valid and invalid function signatures. Execute a series of `call_indirect` instructions within a block followed by a `br` instruction to an outer error handler block, verifying correct branch target resolution on type mismatch.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i32) (result i32)))
    (func $func1 (param i32))
    (func $func2 (param i32) (result i32) (i32.const 42))
    (table funcref (elem $func1 $func2))
    (func $test_block
      (block $outer
        (block
          (br_if 0 (i32.eqz (call_indirect (type $sig2) (i32.const 0))))
        )
      )
    )
  )
  "type mismatch"
)