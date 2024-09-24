;; 9. **Complex Multi-type Operand Test**:    - Design blocks with mixed multi-type operands and branch to one with a different operand configuration through `br`. Ensure that the `br` instruction handles unwinding and restoring the operand stack based on the target block's type constraints, checking for incorrectly resolved labels.

(assert_invalid
  (module
    (func $complex-multi-type-operand-test
      (block (result i32 f64)
        (i32.const 0) (f64.const 0.0)
        (block
          (br 0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)