;; 8. **Test Description**:    - **Test Name**: Conditional Branch in Recursive Function Call    - **Description**: Test a recursive function where a `br_if` instruction branches based on a return value from a recursive call.    - **Constraint Check**: Ensures recursion and stack unwinding are correctly managed with conditional branching.    - **Improper Handling**: Tests correct stack state across recursive calls and conditional branches.

(assert_invalid
  (module
    (func $recursive-br_if (param $n i32) (result i32)
      (if
        (i32.eqz (local.get $n))
        (then (return (i32.const 0)))
      )
      (br_if 0 (call $recursive-br_if (i32.sub (local.get $n) (i32.const 1))))
      (i32.const 1)
    )
  )
  "type mismatch"
)