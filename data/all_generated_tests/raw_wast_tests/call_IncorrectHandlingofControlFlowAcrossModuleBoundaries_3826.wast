;; 5. **Mutual Recursion Across Modules**:    - **Description**: Implement mutual recursion between functions in different modules and ascertain that the recursion depth is handled properly without causing stack overflows or underflows.    - **Constraint**: Recursive calls need to maintain a consistent stack depth.    - **Relation**: Verifies proper handling of control flow in mutually recursive calls across modules.

(assert_invalid
  (module
    (import "mod1" "func1" (func $func1 (param i32) (result i32)))
    (import "mod2" "func2" (func $func2 (param i32) (result i32)))
    (func $type-recursion
      (i32.const 0)
      (call $func1)
      (call $func2)
    )
  )
  "unhandled recursion depth"
)