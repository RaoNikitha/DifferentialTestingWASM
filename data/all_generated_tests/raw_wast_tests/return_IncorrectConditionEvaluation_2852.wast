;; 1. Test if `br_if` correctly skips the block when the condition is false by executing `br_if 0` with a condition that evaluates to `0`. If the engine fails to skip, it highlights incorrect condition evaluation.

(assert_invalid
  (module
    (func $br_if_skip_block (result i32)
      (i32.const 0)
      (block (br_if 0 (return))))
  )
  "type mismatch"
)