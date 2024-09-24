;; 1. **Forward Branch in a Nested Function Call:**    - Description: Create a nested function where an inner function calls another function, which then uses the `br` instruction to branch out of a `block`. Ensure the `br` targets the correct label in the nested structure.    - Constraint: This test checks if the `br` correctly handles the operand stack and resumes execution after the `end` in a scenario involving nested function calls.

(assert_invalid
  (module
    (func $nested-call
      (block (result i32)
        (call $inner)
        (i32.add)
      )
    )
    (func $inner
      (block (result i32)
        (call $target)
        (br 0)
      )
    )
    (func $target
      (i32.const 1)
    )
  )
  "type mismatch"
)