;; 3. **Test with Excessive Stack Operations**    - Write a function where several values are pushed onto the stack, a few operations are performed, followed by a return.    - This ensures that the operand stack does not experience overflow and that excessive values are correctly discarded.    - Verifies stack management and unwinding correctness, detecting overflow/underflow errors.

(assert_invalid
  (module
    (func $excessive-stack-operations (result i32)
      (i32.const 1) (i32.const 2) (i32.const 3) (i32.add) (return)
      (i32.const 4) (i32.add)  ; excessive stack values
    )
  )
  "type mismatch"
)