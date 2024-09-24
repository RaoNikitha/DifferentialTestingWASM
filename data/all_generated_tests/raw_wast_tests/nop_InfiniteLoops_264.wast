;; 5. **Test Description: Use `nop` in an infinite loop where the exit condition is inside a deeply nested structure with `br_if`.**    - **Reasoning**: Ensure `nop` doesn't interfere with deep nesting and branching.    - **Check**: The nested structure should correctly evaluate the `br_if` and exit.

(assert_invalid
  (module
    (func
      (loop
        (block
          (loop
            (nop)
            (block
              (br_if 0 (i32.const 0))
            )
          )
        )
      )
    )
  )
  "unreachable"
)