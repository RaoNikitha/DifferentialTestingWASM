;; 1. **Test Description 1**: Define a `loop` that pushes two integers onto the stack and use `br_if` with a condition targeting the `loop`. Verify that the stack contents are preserved correctly, with a specific focus on whether `wizard_engine` correctly manages the different parameter and result types for the `loop` label.

(assert_invalid
  (module
    (func $type-mismatch-in-loop
      (loop $loop_label (param i32 i32)
        (i32.const 0)
        (i32.const 1)
        (i32.add)
        (br_if $loop_label (i32.const 1))
        (nop)
      )
    )
  )
  "type mismatch"
)