;; 5. **Test Description 5**: Create an `if` block with a `br_if` targeting an enclosing `loop`. The `if` block should push a mix of integer and floating-point values. Check whether `wizard_engine` correctly identifies and preserves the stack layout when using loop parameters vs. block results.

(assert_invalid
  (module
    (func $test
      (loop (param i32) (result i32)
        (i32.const 1) (i32.const 2) (f32.const 3.4)
        (if (result i32) (then (br_if 0 (i32.const 1))))
      )
      (drop)
    )
  )
  "type mismatch"
)