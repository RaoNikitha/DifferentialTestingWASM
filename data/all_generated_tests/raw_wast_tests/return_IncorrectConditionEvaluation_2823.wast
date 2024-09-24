;; 2. **Nested `br_if` with Immediate Return**:    - Design a function with nested blocks where the innermost block has a `br_if` that conditionally returns from the function. Test if incorrect condition evaluation prevents `return` and execute subsequent instructions.

(assert_invalid
  (module
    (func $nested-br_if-return (result i32)
      (i32.const 1)
      (block (br_if 0 (i32.const 0) (return (i32.const 1))))
    )
  )
  "type mismatch"
)