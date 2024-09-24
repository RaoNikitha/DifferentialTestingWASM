;; 4. **Test Unreachable After Function Call:**    - Call a function that returns successfully, then immediately follow it with `unreachable`. Ensure preceding valid instructions execute correctly, and `unreachable` traps as expected.    - **Constraint Checked:** Correct placement of control within functions that lead into `unreachable`.    - **CFG Relation:** Incorrect CFG may fail to respect the boundary of the function call and `unreachable`, causing downstream control flow issues.

(assert_invalid
  (module 
    (func $test_unreachable_after_call
      (call $some_function)
      (unreachable)
    )
    (func $some_function (result i32)
      (i32.const 42)
    )
  )
  "unreachable instruction should trap immediately"
)