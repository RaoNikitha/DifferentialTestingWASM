;; 6. **Test Description**: A test where `call_indirect` is inside conditional branches (`if-else`) nested within a loop. The test uses `br_table` to jump out of both nested conditionals and loops, checking if control flow correctly interprets complex nesting levels.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $f (param i32) (result i32)
      local.get 0
    )
    (table funcref (elem $f))
    (func $test
      (loop
        (if (i32.const 1)
          (then
            (call_indirect (type $sig) (i32.const 0))
            (br_table 0 1 (i32.const 0))
          )
          (else
            (call_indirect (type $sig) (i32.const 1))
            (br_table 0 1 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)