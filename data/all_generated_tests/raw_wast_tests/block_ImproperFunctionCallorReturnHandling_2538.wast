;; 9. **Test Function Call Return Type Misalignment Post Block:**    - Construct a block that makes a function call followed by instructions assuming incorrectly typed return values, without enforcing type compliance.    - **Constraint:** Ensures return type verification and error management post function calls within blocks.

(assert_invalid
  (module (func $test-function-call-return-type-misalignment (result i32)
    (block (result i32)
      (call $some_function) (i32.const 0) (i32.add)
    )
  ))
  "type mismatch"
)