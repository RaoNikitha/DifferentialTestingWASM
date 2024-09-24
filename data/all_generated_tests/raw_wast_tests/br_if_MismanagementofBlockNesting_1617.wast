;; 8. **Test Mixed Structured Control Flow with br_if**:     Simulate a control flow containing mixed `block`, `loop`, and `if` constructs where `br_if` instructions conditionally navigate this flow. Validate if trying to exit the right scope correctly adjusts the stack.

(assert_invalid
  (module
    (func $mixed_control_flow
      (block
        (loop
          (block
            (if (i32.eqz (i32.const 1))
              (then (br_if 1 (i32.const 1)))
              (else (br_if 0 (i32.const 0)))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)