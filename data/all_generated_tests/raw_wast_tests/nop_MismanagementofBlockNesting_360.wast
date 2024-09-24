;; 1. **Nested Block with NOP Inside**: Test a block nested within another block, each containing `nop` instructions. The innermost block ends with a `nop` to check if control flow exits the correct block level.

(assert_invalid
  (module (func $nested-blocks (block (block (nop)) (nop))))
  "type mismatch"
)