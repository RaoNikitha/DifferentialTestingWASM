;; 2. **Test Description**: A test that places `call_indirect` inside a nested `if-else` block and with the `br_table` instruction used within the `else` block to jump outside multiple nested `if-else` blocks, verifying the function's correct handling and navigation.

(assert_invalid
  (module
    (type $t0 (func (param i32) (result i32)))
    (type $t1 (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func0 (result i32)
      (i32.const 1)
      (if (result i32)
        (i32.const 0)
        (else
          (br_table 0 1 (call_indirect (type 0) (i32.const 0)))
        )
      )
    )
    (func $func1 (param i32) (result i32)
      get_local 0
    )
  )
  "type mismatch"
)