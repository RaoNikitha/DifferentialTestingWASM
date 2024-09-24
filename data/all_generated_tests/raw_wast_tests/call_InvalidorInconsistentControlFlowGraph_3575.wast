;; 4. **Function Call in Mismatched Conditional Branches**:    Develop a test with mismatched conditional branches, where different paths lead to different call instructions. This ensures the CFG accurately maps out all potential pathways and correctly validates the function types for each branch.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $mismatched-conditionals
      (local i32)
      (if (i32.const 1)
        (then
          (call $funcA (i32.const 42)))
        (else
          (call $funcB (i32.const 99)))))
    (func $funcA (param i32) (result i32)
      (i32.mul (local.get 0) (i32.const 2)))
  )
  "type mismatch"
)