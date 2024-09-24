;; 10. **Function Call Impact on Block Type in Conditional Execution**:    Use function calls inside an `if` block to influence the block type's output, ensuring that mismatched `call` return processing within conditional structures results in differential outputs on flow return handling.

(assert_invalid
  (module (func $func1 (param i32) (result i32) (local.get 0))
    (func $type-func-call-blocktype-mismatch
      (if (result i32) (i32.const 1)
        (then (call $func1 (i32.const 1)) (i64.const 2))
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)