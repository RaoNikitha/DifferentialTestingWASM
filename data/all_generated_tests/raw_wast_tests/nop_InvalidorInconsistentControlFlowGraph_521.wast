;; 2. **Test `nop` within Conditional Blocks**:    Place `nop` inside the `then` and `else` branches of `if` statements, ensuring the conditional execution path is not altered.

(assert_invalid
  (module
    (func (param i32)
      (if (local.get 0)
        (then (nop))
        (else (nop)))))
  "type mismatch"
)