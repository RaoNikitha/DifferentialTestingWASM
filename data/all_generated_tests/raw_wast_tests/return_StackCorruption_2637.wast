;; 6. **Test Large Stack Operations**:    - Create a function that performs extensive stack operations, pushing and popping large sequences of values before invoking `return`. This checks both implementations for maintaining stack integrity under heavy load.

(assert_invalid
  (module
    (func $large-stack-ops (result i32)
      (i32.const 10) (i32.const 20) (i32.const 30) (i32.const 40) (i32.const 50)
      (i32.const 60) (i32.const 70) (i32.const 80) (i32.const 90) (i32.const 100)
      (drop) (drop) (drop) (drop) (drop) (drop) (drop) (drop) (drop) (return))
  )
  "type mismatch"
)