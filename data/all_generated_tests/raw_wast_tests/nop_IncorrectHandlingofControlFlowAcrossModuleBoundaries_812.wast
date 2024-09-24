;; 3. **Test Description**: Implement a test where Module A has a function that performs multiple `nop` operations and then proceeds to call an exported function from another module, Module B. Verify that `nop` instructions do not interfere with the execution flow when the function call transitions control from Module A to Module B.

(assert_invalid
  (module
    (func $module_a_function
      nop nop nop
      call $module_b_function
    )
    (func $module_b_function)
  )
  "undefined function '$module_b_function'"
)