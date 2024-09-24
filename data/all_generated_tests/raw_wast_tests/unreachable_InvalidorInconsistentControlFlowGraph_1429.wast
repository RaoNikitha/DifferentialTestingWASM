;; Test 10: Combine `unreachable` within a sequence of valid and invalid stack type changes to see if the type polymorphism of `unreachable` is ignored or incorrectly inferred amidst irregular CFG paths.

(assert_invalid
  (module (func $unreachable-poly (result i32)
    (block
      (unreachable)
      (i32.const 1)
    )
    (i32.const 0)
    (i32.add)
  ))
  "type mismatch"
)