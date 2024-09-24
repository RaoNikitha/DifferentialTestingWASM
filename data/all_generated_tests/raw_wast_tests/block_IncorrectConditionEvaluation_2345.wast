;; 6. Design a block that performs arithmetic operations, resulting in conditions for `br_if`. Set constants to change the expected flow by toggling between true and false conditions. Verify if the block terminates as expected or if it skips instructions due to condition bugs.

(assert_invalid
  (module
    (func $block_br_if (result i32)
      (block (result i32)
        (i32.const 1)  ;; push 1
        (i32.const 0)  ;; push 0
        (i32.add)      ;; add top two values
        (br_if 0 (i32.const 0))  ;; conditionally branch if top of stack is true
        (i32.const 42) ;; should be skipped if branch taken
      )
    )
  )
  "type mismatch"
)