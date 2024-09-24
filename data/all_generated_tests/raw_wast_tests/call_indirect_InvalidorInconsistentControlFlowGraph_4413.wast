;; 2. **Test Operand Underflow in Nested Loops**:    - Create a scenario where `call_indirect` is executed inside nested loops, with insufficient operands provided for each call within the inner loop.    - Ensure the test examines how the operand stack is managed within nested structures for correct CFG and error trapping.    - This test checks for proper CFG generation and whether operand underflows are correctly trapped without disrupting the loops.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f))
    (func $f (param i32) (result i32) (i32.const 42))
    (func $test
      (loop
        (loop
          (call_indirect (type $sig) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)