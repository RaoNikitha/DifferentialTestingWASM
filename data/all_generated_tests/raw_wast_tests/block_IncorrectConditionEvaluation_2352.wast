;; Test Description 3: A `block` followed by a `br_if` which should always fall through when the condition evaluates to zero. Test with different zero values on the operand stack and check whether the stack unwinding and control flow continue correctly without taking the branch.

(assert_invalid
  (module (func $block-br_if-zero-stack
    (block 
      (i32.const 0)
      (br_if 0)
    )
  ))
  "type mismatch"
)