;; 3. **Deeply Nested Conditional and Loop Combination**:    Have deeply nested `if-else` blocks within a nested loop and use a `br_table` to indirectly branch.    This examines whether the stack and control flow handle nesting depth correctly and avoid jumping out of scope.

(assert_invalid
  (module (func $deeply_nested_conditional_loop_combination (result i32)
    (loop (result i32)
      (i32.const 0)
      (loop (result i32)
        (if (result i32)
          (i32.const 1)
          (then
            (br_table 0 1 (i32.const 0))
          )
          (else
            (i32.const 1)
          )
        )
        (i32.const 2)
        (br_table 0 1 (i32.const 1))
      )
    )
  ))
  "type mismatch"
)