;; 4. **Block with Multiple Branch Targets:**    - Use an `unreachable` in a block containing multiple `br` targets. The block should be nested in another block. Verify if the `unreachable` prevents proper execution flow and check if the branch instructions resolve correctly when not trapped.

(assert_invalid
  (module (func $block_with_multiple_branch_targets
    (block (i32.const 0) (unreachable) (br 1))
    (block (unreachable) (br 0))
  ))
  "type mismatch"
)