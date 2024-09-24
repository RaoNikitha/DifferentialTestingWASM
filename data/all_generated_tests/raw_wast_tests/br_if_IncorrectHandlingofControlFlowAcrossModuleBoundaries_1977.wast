;; 8. **Test 8: Conditional `br_if` in Chaining Calls between Modules**    - **Description**: Establish a chain of function calls across modules wherein a `br_if` conditional exit triggers a call to the next function in the chain. Examine continuity and operand handling from one module's boundary to the next, ensuring stack consistency.

(assert_invalid
  (module
    (func $test-func
      (block (result i32)
        (br_if 0 (call $next-func (i32.const 1)) (i32.const 0))
        (i32.const 0)
      )
    )
    (func $next-func (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
  )
  "type mismatch"
)