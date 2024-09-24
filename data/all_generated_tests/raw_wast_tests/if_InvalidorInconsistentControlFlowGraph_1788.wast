;; 9. **Test: Incorrect Nested Block Type Propagation**    - **Description**: Use nested `if` instructions with incorrect propagation of block types into inner blocks.    - **Constraint Checked**: Correct propagation and enforcement of block types within nested blocks.    - **CFG Relevance**: Checks how CFG manages type information propagation within nested control flows.

(assert_invalid
  (module
    (func $incorrect-nested-block-type-propagation (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (if (result i64)
            (i32.const 1)
            (then (i64.const 1))
            (else (i64.const 2))
          )
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)