;; 4. **Test Description:**    A function call within a sequence of instructions that includes `unreachable`. Tests if calling the function post-`unreachable` results in stack corruption.    <br>**Constraint:** Validate that the function call never happens and the stack remains unchanged due to `unreachable`.

(assert_invalid
  (module (func $test_unreachable_with_call
    (unreachable) (call $some_function)
  ) (func $some_function (result i32)
    (i32.const 42)
  ))
  "unreachable code"
)