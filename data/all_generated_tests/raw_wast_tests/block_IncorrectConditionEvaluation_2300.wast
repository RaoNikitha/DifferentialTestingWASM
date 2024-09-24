;; 1. A test with a `block` that wraps a `br_if` conditioned on a value that is always `false`. This checks if the block ends correctly without branching due to incorrect condition evaluation.

(assert_invalid
  (module (func $type-block-with-br_if-false (result i32)
    (block (result i32) (i32.const 0) (br_if 0 (i32.const 0)) (i32.const 1))
  ))
  "type mismatch"
)