;; Test 7: Implement a `br_table` that branches based on a condition where the operand index exactly matches the upper boundary of the label vector, confirming if the implementation correctly identifies in-bound label indices. This test checks boundary condition handling specifically.

(assert_invalid
  (module (func $boundary-test
    (block (br_table 0 1 (i32.const 1)) )
  ))
  "unknown label"
)