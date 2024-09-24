;; 3. **Invalid Branch in Conditional Block within Loop**: Design a loop containing an `if-else` block where a `br_if` instruction attempts to exit to an outer loop level erroneously. This will test the precise handling of nested conditions within loops, targeting potential issues with branch indexing managed by error functions.

(assert_invalid
  (module (func $invalid-branch-nested-loop
    (loop (result i32)
      (i32.const 42)
      (i32.const 1)
      (if (result i32)
        (then
          (br_if 1 (i32.const 0)) ;; attempts to jump to an outer scope, should be invalid
          (i32.const 0)
        )
        (else
          (i32.const -1)
        )
      )
    )
  ))
  "type mismatch or invalid branch target"
)