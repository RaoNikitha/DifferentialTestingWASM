;; 3. **Test 3: Nested Function Calls Before Branch**    - Description: Test nested function calls followed by a `br_table` operation to multiple labels with different stack requirements.    - Constraint Checked: Stack consistency and operand type matching after nested function calls.    - Improper Function Call or Return Handling: Verifying that nested function calls and unwinding are properly managed with `br_table`.

(assert_invalid
  (module
    (func $nested-function-calls
      (result i32)
      (block (result i32)
        (i32.add 
          (call $add (i32.const 3) (i32.const 5))
          (call $sub (i32.const 2) (i32.const 1))
        )
        (br_table 1 0 (i32.const 1))
      )
    )
    (func $add (param i32 i32) (result i32)
      (i32.add (local.get 0) (local.get 1))
    )
    (func $sub (param i32 i32) (result i32)
      (i32.sub (local.get 0) (local.get 1))
    )
  )
  "type mismatch"
)