;; Test 10: Place `nop` within an instruction sequence inside a nested control structure (e.g., `if` within a `loop`), ensuring the innermost instruction has a type-producing conflict with the outer control expectation. Validate type-check robustness.

(assert_invalid
  (module
    (func $nested-nop
      (block
        (loop
          (if (i32.const 0)
            (then
              (nop)
              (i32.const 1)  ;; Type-producing conflict
            )
          )
        )
      )
    )
  )
  "type mismatch"
)