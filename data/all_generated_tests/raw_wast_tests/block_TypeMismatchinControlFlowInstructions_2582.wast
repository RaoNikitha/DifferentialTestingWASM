;; 3. Create a nested `block` where the outer block expects `i32` but the inner `block` produces `f64`, checking whether the outer block correctly checks the inner block's result.

(assert_invalid
  (module (func $nested-block-mismatch
    (block (result i32)
      (block (result f64)
        (f64.const 0.0)
      )
    (i32.const 0))
  ))
  "type mismatch"
)