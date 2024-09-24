;; 8. **Conditional Loop Exit:**    - Test Condition: A loop which has an `if` instruction with a conditional branch `br_if` that should terminate the loop when true.    - Constraint: Correct stack and context handling allowing conditional loop exits.    - Relevance: Tests handling of condition-based loop termination to avoid infinite loops.

(assert_invalid
  (module
    (func $conditional-loop-exit
      (loop (result i32)
        (i32.const 1) (i32.const 0) (i32.sub)
        (if (result i32)
          (then (br_if 1 (i32.const 0)))
          (else (i32.const 1))
        )
        (drop)
      )
    )
  )
  "type mismatch"
)