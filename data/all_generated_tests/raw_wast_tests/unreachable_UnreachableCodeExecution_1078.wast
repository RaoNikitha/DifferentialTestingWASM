;; 9. Use multiple `unreachable` instructions spaced out within a sequence interspersed with valid operations, testing if each instance leads to a trap without any misinterpretation of stack types by either implementation.

(assert_invalid
  (module (func $type-multiple-unreachable-interspersed
    (block
      (unreachable)
      (i32.const 42)
      (drop)
      (unreachable)
      (i64.const 100)
      (drop)
      (unreachable)
      (f32.const 0.5)
      (f32.neg)
      (drop)
      (unreachable)
      (f64.const 2.0)
      (f64.sqrt)
      (drop)
      (unreachable)
    )
  ))
  "type mismatch"
)