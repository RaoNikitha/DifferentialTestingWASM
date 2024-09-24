;; 4. **Interleaved Loops and Blocks**:    - Create interleaved `loop` and `block` constructs. Within these constructs, use both `br` and `br_if` instructions to exit loops or blocks. Verify that branches correctly differentiate and manage exits between loops and blocks. Failure to distinguish may cause the control flow to exit unintended scopes.

(assert_invalid
  (module (func
    (block
      (loop (block (br 1)) (br 0))
    )
  ))
  "type mismatch"
)