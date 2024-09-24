;; Test 3: Construct a block that produces a `resultType` of `i64`, but contains instructions that produce `f64` values. This checks if the implementation enforces the block result type correctly by validating the actual values pushed onto the stack.

(assert_invalid
  (module (func $type-block-result-i64-vs-f64 (result i64)
    (block (result i64) (f64.const 1.0) (f64.const 2.0))
  ))
  "type mismatch"
)