;; Test 8: Create a function that utilizes a `call` to another function which evaluates a nested combination of logical conditions. Use `br_if` based on this complex condition evaluation.

(assert_invalid
  (module
    (func $complex-br-if-call (result i32)
      (call $evaluate-conditions)
      (br_if 0 (i32.const 1))
    )
    (func $evaluate-conditions (result i32)
      ;; Complex condition evaluation
      (i32.and
        (i32.eq (i32.const 1) (i32.const 1))
        (i32.lt_s (i32.const 2) (i32.const 3))
      )
    )
  )
  "type mismatch"
)