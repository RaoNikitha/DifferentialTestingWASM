;; 6. **Loops with Complex Operand Types**:    Implement nested `loops` where the `blocktype` defines complex input and output operand types. This test checks whether both implementations correctly handle type checking and stack management when loops involve more complex type scenarios. Verify whether types are properly consumed and pushed during branching within nested loops.

(assert_invalid
  (module
    (func $nested-loops-with-complex-operands
      (loop (result i64)
        (i64.const 42)
        (loop (param i64) (result i64)
          (br_if 1 (i64.eq (i64.const 1) (i64.const 2)))
        )
      )
    )
  )
  "type mismatch"
)