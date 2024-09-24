;; 3. **Test 3: Function Calls Modifying Stack State Incorrectly**    - **Constraint:** Validate stack state after multiple function calls within a loop.    - **Description:** Design a loop that repeatedly calls a function altering stack variables. If the stack state after the function call is incorrect, the loop might fail to terminate, causing an infinite loop.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $f (param i32) (result i32)
      local.get 0
    )
    (func $test-loop
      i32.const 0
      loop
        call $f
        drop
        br_if 0
      end
    )
  )
  "stack state mismatch"
)