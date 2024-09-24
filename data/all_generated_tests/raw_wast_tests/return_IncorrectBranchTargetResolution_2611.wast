;; - Create multiple nested loops where each loop has its own return instruction. Test if returning from the innermost loop’s block correctly breaks all outer loops and terminates the function or if it mistakenly re-enters an intermediate loop or block.

(assert_invalid
  (module
    (func $nested-loops-return-mismatch (result i32)
      (loop (loop (loop (return (i32.const 0)))))
      (i32.const 1)
    )
  )
  "type mismatch"
)