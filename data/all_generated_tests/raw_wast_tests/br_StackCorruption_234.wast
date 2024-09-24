;; 5. Construct a scenario where a `br` instruction within an `if` statement targets another `if` statement on a different nesting level. Ensure operand stacks for both `if` blocks are handled appropriately and any discrepancies cause stack corruption, recognizing if the branch logic is not managing types correctly.

(assert_invalid
  (module (func $nested-if-br-stack-mismatch (result i32)
    (block (result i32)
      (block (result i32)
        (if (i32.const 1)
          (then (i32.const 1) (br 1))
          (else (br 0))
        )
        (i32.const 2)
      )
    )
  ))
  "type mismatch"
)