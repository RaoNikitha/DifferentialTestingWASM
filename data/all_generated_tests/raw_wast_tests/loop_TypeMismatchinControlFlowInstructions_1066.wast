;; Test 7: Form a loop with nested blocks where the innermost block produces a type different from what the outer loop expects. Exiting the nested block should cause a type mismatch, testing nested type constraint enforcement.

(assert_invalid
  (module
    (func $nested-loop-type-mismatch
      (loop (result i32)
        (block (result f64)
          (f64.const 1.0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)