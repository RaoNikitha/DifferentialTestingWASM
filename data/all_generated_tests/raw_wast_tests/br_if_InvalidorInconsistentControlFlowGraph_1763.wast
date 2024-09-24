;; 4. **Test Description**: Construct a scenario where a `br_if` targets a `loop` within a conditional branch (`if`). Validate that the `loop`’s parameter types match the values left on the stack when the branch is taken.    - **Constraint Checked**: Operand consistency in conditional loops.    - **CFG Relation**: Ensures that the CFG accurately represents branches into loops within conditionals.

(assert_invalid
  (module
    (func $br_if_conditional_loop
      (block
        (if (i32.const 1)
          (then
            (loop (br_if 0 (i32.const 1)) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)