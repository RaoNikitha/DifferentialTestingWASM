;; 5. **Stack Manipulation within Blocks and Callbacks**    - Embed callbacks from imported functions within a block and check if the block’s stack state correctly handles the return values and intermediate stack states.    - Specifically targets stack behaviors and ensuring calls across module boundaries retain appropriate states on the return.

(assert_invalid
  (module
    (import "env" "callback" (func $callback (result i32)))
    (func $block_with_callback
      (result i32)
      (block (result i32)
        (i32.const 1)
        call $callback
        (i32.add)
        (br 0 (i32.const 2))
      )
    )
  )
  "type mismatch"
)