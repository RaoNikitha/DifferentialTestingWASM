;; 5. **Condition with Stack Manipulation**: Construct a test where the condition depends on multiple stack manipulation operations (push, pop) just before the `if` instruction. Ensure the branching depends on the manipulated condition. Check if the implementation has bugs related to stack state affecting condition evaluation.

(assert_invalid
  (module
    (func $condition-stack-manipulation
      (i32.const 1)
      (i32.const 2)
      (i32.add)
      (if (then (i32.const 3) drop) (else (i32.const 4)))
    )
  )
  "type mismatch"
)