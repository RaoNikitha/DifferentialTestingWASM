;; 7. **Nested Calls with Multiple Branches:**    - Description: Create a complex function with multiple nested function calls and `br` instructions targeting different labels. Ensure each function call returns the expected value.    - Constraint: This test examines the proper handling of nested function calls and multiple `br` instructions, focusing on operand stack consistency and correct return values.

(assert_invalid
  (module
    (func $nested_calls_with_br
      (block (result i32)  ;; Block 0
        (block (result i32)  ;; Block 1
          (loop (result i32)  ;; Loop 2
            (block (result i32)  ;; Block 3
              (br 3 (i32.const 42))  ;; Branch out to Block 0
            )
          )
        )
      )
    )
  )
  "type mismatch"
)