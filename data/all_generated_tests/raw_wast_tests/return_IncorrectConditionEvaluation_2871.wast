;; 10. **Nested Branching with Early Return and Type Checks**:    - Implement a function with nested branching (`br` and `br_if`) where early return statements check and enforce operand types. Validate the stack and return type compliance.    - **Reasoning**: Ensures differential checks on operand management, examining stack-type transitions and validation of conditionally-affected return paths.

(assert_invalid
  (module
    (func $nested_br_with_early_return (param i32) (result i32)
      (block
        (block
          (i32.const 1)
          (br_if 1 (local.get 0))
          (i32.const 2)
          (br 0)
        )
        (return (i32.const 3))
      )
    )
  )
  "type mismatch"
)