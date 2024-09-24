;; 1. A test where a `loop` contains a `br_if` that should exit the loop based on a specific condition, followed by a `return`. Check if the `return` correctly handles the stack after the conditional branch is evaluated.

(assert_invalid
  (module
    (func $type-loop-br-if-return (result i32)
      (i32.const 0)
      (loop (result i32)
        (br_if 0 (i32.const 1) (i32.const 0))
        (return)
      )
      (i32.const 1) ;; This value would mismatch if return did not behave correctly
    )
  )
  "type mismatch"
)