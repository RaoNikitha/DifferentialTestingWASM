;; 10. **Test Description**: Use `br_if` to conditionally jump out of a nested `if` or `block` statement based on a value returned by an imported function with side effects (e.g., modifying global state). Check if the stack height matches expectations in both cases.     - **Constraint Checked**: Correct branching and stack height management when dealing with side effects from imported functions.     - **Relation to Control Flow**: Verifies stack consistency and control flow correctness when influence by external functions with side effects on the operand stack.

(assert_invalid
  (module
    (import "env" "extern_func" (func $extern_func (result i32)))
    (func (export "test_func") (result i32)
      (block (result i32)
        (if (i32.eqz (call $extern_func))
          (then (br_if 0 (i32.const 0)))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)