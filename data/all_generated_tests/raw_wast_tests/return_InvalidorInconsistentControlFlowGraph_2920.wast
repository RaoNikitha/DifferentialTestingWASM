;; **Test 9: Control Structure with Conditional Return**  Develop scenarios using if-else constructs that conditionally return based on the operands processed. WebAssembly and Wizard Engine’s stack and type CFG should validate how conditional structures manage returns. Ensure correct paths are reflected in CFG with proper type and operand management.  _Checks CFG balance for conditional return paths ensuring consistent final type state._

(assert_invalid
  (module
    (func $test-conditional-return (result i32)
      (i32.const 1)
      (if (then (return (i32.const 1))) (else (return)))
    )
  )
  "type mismatch"
)