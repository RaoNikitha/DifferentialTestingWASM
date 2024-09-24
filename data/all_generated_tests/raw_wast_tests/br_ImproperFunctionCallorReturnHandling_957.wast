;; 8. **Test 8: Returning from Function in a Block Post `br`**    - **Description:** Use a `br` instruction within a function, enclosed inside a block, targeting the block's end, then returning. Validate consistent operand stack and execution flow.    - **Reasoning:** Examines the interaction between block-based control flow and function calls.

(assert_invalid
  (module
    (func $block-after-br-target-function (result i32)
      (block (result i32)
        (br 0)
        (return (i32.const 1))
      )
      (i32.const 0)
    )
  )
  "type mismatch, stack height inconsistent"
)