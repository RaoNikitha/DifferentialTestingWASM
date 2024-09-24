;; 4. **Unreachable at End of Else Block**:    Include an `unreachable` instruction at the end of an `else` block. This will test whether the control correctly bypasses after completing the `else` instructions.    ```    if (i32.const 0) i32.const 2 else i32.const 3 unreachable end    ```

(assert_invalid
  (module (func $unreachable-end-else (result i32)
    (if (result i32) (i32.const 0)
      (then (i32.const 2))
      (else (i32.const 3) unreachable)
    )
  ))
  "type mismatch"
)