;; 9. **Test Description**: Implement a `br_if` in a function with multiple `block` and `loop` structures. Test both zero and non-zero conditions to ensure correct branching behavior in complex nesting scenarios.

(assert_invalid
  (module
    (func $complex-br_if
      (block (loop (block (br_if 2 (i32.const 1))))
             (i32.const 0)
             (br_if 0)
             (loop (block (br_if 1 (i32.const 0)))))
  ))
  "type mismatch"
)