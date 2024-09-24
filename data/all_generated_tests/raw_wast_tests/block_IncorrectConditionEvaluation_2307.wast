;; 8. Implement a `block` with a `blocktype` of `[] -> [i32]` and use `br_if` to condition on stack values. This test examines whether condition evaluation incorrectly affects the block’s output.

(assert_invalid
  (module (func $condition-evaluation-affects-output (result i32)
    (block (result i32)
      (br_if 0 (i32.const 1) (i32.const 0)) 
      (i32.const 42)
    )
  ))
  "type mismatch"
)