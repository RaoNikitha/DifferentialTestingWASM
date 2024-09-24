;; 8. Test a block with an inner conditional branch and `unreachable`. Check if condition evaluation reflects correctly. Constraint: Tests block encapsulation's effect on condition evaluation for branching. Example: `(block (i32.const 1) (br_if 0 (unreachable)))`

(assert_invalid
  (module (func $block-with-inner-cond-branch-with-unreachable
    (block (i32.const 1) (br_if 0 (unreachable)))
  ))
  "type mismatch"
)