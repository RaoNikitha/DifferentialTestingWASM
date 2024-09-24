;; 3. **Mismatched If-Else Branch Types**:    - Use an if-else block where the 'if' branch contains a `nop` and expects an integer, while the 'else' branch returns a float.    - Looks for type consistency in control flow with `nop` in one of the branches.    - **Reasoning**: Verifies `nop` doesn't interfere with branch result types.

(assert_invalid
  (module
    (func
      (if (result i32)
        (i32.const 1)
        (then (nop) (i32.const 5))
        (else (f32.const 1.0))
      )
    )
  )
  "type mismatch"
)