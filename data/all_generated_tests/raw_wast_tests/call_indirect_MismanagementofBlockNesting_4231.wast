;; 10. **Test Description**: Place `call_indirect` in the middle of nested blocks with mixed conditional and loop constructs, with `br_table` designed to break out to an intermediate nested block, validating correct interpretation of nesting and exits.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $test
      (block
        (loop
          (block
            (block
              (call_indirect (type 0) (i32.const 0))
              (br_table 0 1 2 (i32.const 0))
            )
          )
          (call_indirect (type 0) (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)