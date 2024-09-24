;; 6. Test a `block` where a `br_if` condition depends on a calculation inside the block, checking that the stack handles intermediate values correctly and the condition correctly dictates branch execution.

(assert_invalid
  (module (func $test (result i32)
    (i32.const 5)
    (i32.const 2)
    (block (result i32)
      (i32.mul)
      (i32.const 1)
      (br_if 0 (i32.eqz)) ; This br_if should branch to the end of the block if the condition is true
    )
  ))
  "type mismatch"
)