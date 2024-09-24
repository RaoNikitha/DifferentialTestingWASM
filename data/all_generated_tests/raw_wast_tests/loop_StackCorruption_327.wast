;; 8. Implement a loop that executes arithmetic operations, pushes results to the stack, and branches back to the start conditional on certain results (`br_if`). Validate that arithmetic results and stack changes persist correctly after the branch.

(assert_invalid
  (module (func $arithmetic-loop-stack-persistence
    (i32.const 5) (loop $L (param i32)
      i32.const 1
      i32.sub
      br_if $L))
  ))
  "type mismatch"
)