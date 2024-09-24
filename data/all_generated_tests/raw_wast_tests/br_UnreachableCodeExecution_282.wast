;; 3. **Invalid Forward Branch in Conditional Block:**    - Test Description: Use an `if` block with an `else` part and insert a `br` instruction that incorrectly targets a label outside the allowed scope, causing an `unreachable` instruction in the conditional block to be executed.    - Constraint: This confirms proper enforcement of structured control flow rules in conditional blocks.

(assert_invalid
  (module
    (func $invalid_forward_branch_in_conditional_block
      (block
        (if (i32.const 1)
          (then (br 2))
          (else (unreachable))
        )
      )
    )
  )
  "integer out of range"
)