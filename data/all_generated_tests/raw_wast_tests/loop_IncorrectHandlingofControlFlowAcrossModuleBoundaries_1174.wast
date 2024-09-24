;; 5. Test a loop that interacts with an imported function that itself contains a loop with `br` and `br_if` instructions. Ensure that the operand stack and control flow contexts are correctly managed when returning to the original loop.

(assert_invalid
  (module
    (import "js" "func" (func $imported))
    (func $type-loop-with-imported-call (loop (br 0)) (call $imported) (nop))
  )
  "type mismatch"
)