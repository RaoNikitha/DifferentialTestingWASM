;; 10. **Test Description**:    An `if` block that contains a loop within its `then` branch which continuously adds integers to the stack for a set number of iterations, while the `else` branch includes no-op instructions. Check for correctly maintained stack height after loop completion and `end` statement processing.

(assert_invalid
  (module
    (func $if-then-loop (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (loop (result i32)
            (i32.const 1)
            (i32.add)
            (br_if 1 (i32.eqz (i32.const 0)))
          )
        )
        (else (nop))
      )
    )
  )
  "type mismatch"
)