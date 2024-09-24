;; 4. **Test Description**:    - **Test Name**: Conditional Branch with Function Return Value    - **Description**: Use a function that returns multiple values and test a `br_if` that operates on one of these return values.    - **Constraint Check**: Checks that the `br_if` instruction correctly processes multiple return values and branches based on the specific operand.    - **Improper Handling**: Validates handling of multiple return values and stack unwinding.

(assert_invalid
  (module
    (func $multi-value-return (result i32 i32)
      i32.const 1
      i32.const 2
    )
    (func $test
      (block (result i32)
        (call $multi-value-return)
        (br_if 0 (i32.eqz (i32.const 0)) (i32.const 1))
      )
    )
  )
  "type mismatch"
)