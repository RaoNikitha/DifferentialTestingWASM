;; 9. **Exported Function Handling Multiple Return Paths with `unreachable`:**    - Prepare a module exporting a function with multiple return paths, one of which contains the `unreachable` instruction. Another module calls this function and includes further instructions post-call.    - **Constraint:** Verifies the handling of traps in exported functions with various control flow paths.

(assert_invalid
  (module 
    (func $type-exported-multiple-returns (result i32)
      (if (i32.const 1) 
        (then (return (i32.const 42))))
      (unreachable)
      (i32.const 0)
    )
    (export "multiple_returns" (func $type-exported-multiple-returns))
  )
  "type mismatch"
)