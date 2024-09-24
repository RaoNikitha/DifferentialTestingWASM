;; 8. **Test 8**: Establish an `if-else` construct where the `if` condition is orchestrated through function calls that modify the stack extensively. Discrepancies between the operand stack management in the `then` and `else` branches should cause stack corruption, revealing discrepancies in type validation handling.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (result i32) (i32.const 0)
        (then
          (call $modify_stack)
          (i32.const 42)
        )
        (else
          (i32.const 1)
        )
      )
    )
    (func $modify_stack (param i32) (result i32)
      (if (result i32) (i32.const 1)
        (then
          (i32.const 10)
        )
        (else
          (i32.const 20)
        )
      )
    )
  )
  "type mismatch"
)