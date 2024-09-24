;; 6. Implement a `block` that should return `i32` and include an `unreachable` followed by `i64.const 1`, to see if the interpreter respects the type constraint for the block result.

(assert_invalid
  (module (func
    (block (result i32) (unreachable) (i64.const 1))
  ))
  "type mismatch"
)