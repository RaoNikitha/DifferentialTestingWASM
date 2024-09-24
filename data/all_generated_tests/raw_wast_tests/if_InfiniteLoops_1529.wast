;; 10. **Multiple Nested Loops with If Conditions:**     - Test Condition: Multiple `if` instructions within nested loops with varying branch conditions to manage each loop's exit.     - Constraint: Validate correct label indexing and stack management across multiple loops and condition checks.     - Relevance: Tests the robustness of control flow management in highly nested loop structures to avoid infinite loops.

(assert_invalid
  (module
    (func $nested-loops-if (param i32) (result i32)
      (block $out
        (loop $outer
          (i32.const 1)
          (if (result i32) (local.get 0)
            (then
              (loop $inner
                (i32.const 2)
                (if (result i32)
                  (i32.eqz (local.get 0))
                  (then (br $outer))
                  (else (br $inner))
                )
              )
            )
          )
        )
      (i32.const 3)
      )
    )
  )
  "type mismatch"
)