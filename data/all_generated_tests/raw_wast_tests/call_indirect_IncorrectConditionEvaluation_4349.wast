;; 8. Test Description 8: Use a table with multiple functions of incorrect and correct types. Execute `call_indirect` with a correct operand and follow up with a `br_if` that improperly evaluates to see if it avoids traps it should trigger.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func (type 0) (nop))
    (func (type 1) (nop))
    (func $test
      (block $exit
        (call_indirect (type 0) (i32.const 0) (i32.const 42))
        (br_if $exit (i32.const 1))
      )
    )
  )
  "type mismatch"
)