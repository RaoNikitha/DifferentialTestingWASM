;; 8. **Test Description:**    - Construct a series of nested `block` and `if-else` constructs, where the final `else` contains multiple intermediary values on the stack before a `return`.    - Ensure substantial stack manipulation before hitting `return`.    - Validates correct unwinding and return behavior from function without intermediate values interference.    - **Specific Constraint:** Mismanagement of control stack and operand stack interaction within nested block constructs.

(assert_invalid
  (module
    (func $nested-blocks-if-else-return (result i32)
      (block
        (block
          (block
            (if
              (then
                (i32.const 1) (i32.const 2)
                (else
                  (i32.const 3)
                  (return)
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)