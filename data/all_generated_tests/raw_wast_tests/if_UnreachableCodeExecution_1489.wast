;; 10. **Unreachable on Invalid Blocktype**:    Use an `if` with conflicting blocktypes leading to an unreachable to check stack type handling.    ```    if (result i32) i32.const 1 else unreachable i32.const 2 end    ```

(assert_invalid
  (module
    (func
      (if (result i32) (i32.const 1) (else (unreachable)) (i32.const 2))
    )
  )
  "type mismatch"
)