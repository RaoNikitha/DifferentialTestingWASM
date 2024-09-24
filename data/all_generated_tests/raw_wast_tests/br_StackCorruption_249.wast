;; 10. **Test Description**: Construct a WebAssembly module where `br` instructions target labels across nested `block`, `loop`, and `if` structures. Ensure the operand stack has significant variations in its height across labels to verify proper stack unwinding and order preservation, checking for any signs of stack corruption.

(assert_invalid
  (module
    (func $test_nested_control_structures
      (local i32)
      (block (result i32)
        (loop (result i32)
          (i32.const 42)
          (block (result i32)
            (br_if 0 (i32.const 1))
            (if (result i32)
              (then
                (br 2)
              )
              (else
                (i32.const 99)
                (br 3)
              )
            )
          )
          (i32.const 55)
        )
      )
    )
  )
  "type mismatch"
)