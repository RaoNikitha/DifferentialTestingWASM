;; 5. **Test for Mismatched Operand Stack in Nested Loop**: Implement nested loops where the inner loop creates mismatched operand stack types that the outer loop cannot handle (e.g., inner loop results in `f64` while outer loop expects `i64`).

(assert_invalid
  (module
    (func $nested-loop-mismatch (result i64)
      (loop (result i64)
        (loop (result f64)
          unreachable
        )
      )
    )
  )
  "type mismatch"
)