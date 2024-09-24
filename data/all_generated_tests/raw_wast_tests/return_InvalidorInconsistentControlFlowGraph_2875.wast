;; 4. **Multiple Returns with Conflicting Types**:    - Implement multiple `return` instructions within a function body, each with different operand types. This will test if the CFG ensures type consistency across different return points and how each implementation validates it.

(assert_invalid
  (module
    (func $multiple-returns-with-conflicting-types (result i32)
      (i32.const 0)
      (block
        (return (i32.const 1))
        (return (f32.const 2.0))
      )
    )
  )
  "type mismatch"
)