;; 7. An outer block that expects an `i32` result, while an inner `block` or `loop` ends with a `br` that incorrectly places an `f64` value on the stack, testing backtracking of types.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (block
          (br 1 (f64.const 1.0))
        )
      )
    )
  )
  "type mismatch"
)