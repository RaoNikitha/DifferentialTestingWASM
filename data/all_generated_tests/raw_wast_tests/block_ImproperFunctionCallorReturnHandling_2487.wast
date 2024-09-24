;; Write a block containing a `br_if` (branch if) instruction that will conditionally branch out of the block to a label outside, with the target of that branch being after a function call. This assesses the proper stack management on conditional branches out of nested call structures.

(assert_invalid
  (module (func $conditional-branch-out-of-block
    (block (block (result i32) (i32.const 1) (br_if 1 (call $someFunction))) (i32.const 0))
  ))
  "type mismatch"
)