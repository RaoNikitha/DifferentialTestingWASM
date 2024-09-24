;; 4. **Test Description: Unwound Stack Mismanagement on Backward Branch**    - **Reasoning**: When branching to a `loop`, the stack should rewind according to the loop's entry context.    - **Constraint Checked**: Proper unwinding of the operand stack for backward jumps.    - **Inconsistent CFG**: Failure to account for stack unwinding can disrupt subsequent control flow.    - **Expected Differential Behavior**: WASM detects a generic invalid state, whereas wizard_engine reports `EmptyValueStackExpecting` for mismatched operand stack after unwinding.

(assert_invalid
  (module
    (func $unwound-stack-mismanagement
      (block $outer
        (loop $inner
          (i32.const 1)
          (br_if 1 (i32.const 1))
          (i32.const 2)
        )
        (i32.const 0)
      )
    )
  )
  "operand stack mismatch"
)