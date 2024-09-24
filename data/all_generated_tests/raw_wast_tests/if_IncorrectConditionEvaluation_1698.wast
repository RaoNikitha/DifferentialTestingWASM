;; 9. **Test Description**: Implement an `if` block with a complex condition that involves multiple logical operations (e.g., AND, OR). This test ensures these operations are combined correctly to determine the correct execution path.

(assert_invalid
  (module (func $complex-condition
    (if (param i32) (result i32)
      (local.get 0) (i32.const 1) (i32.and) (i32.const 1)
      (then (i32.const 42))
      (else (i32.const -1))
    )
  ))
  "type mismatch"
)