;; **Test 7: Misaligned Operand Count on Function Return**  Design a function to push a varying number of operands compared to expected return types and trigger return, tapping into Wizard Engine’s popE validation against WebAssembly’s operand expectations. This tests CFG's consistency around mismatched operand counts at return points.  _Checks CFG consistency for operand counts aligning with function return types._

(assert_invalid
  (module
    (func $misaligned-operands-return
      (result i32)
      (i32.const 42) ; Pushes 1 operand
      (i32.const 43) ; Pushes another operand
      (return) ; Should only return 1 operand of type i32, now stack has 2
    )
  )
  "type mismatch"
)