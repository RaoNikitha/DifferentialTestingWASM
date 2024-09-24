;; 5. **Test Case 5: Nested Calls with Unreachable in Imported Function**    - **Description:** Module A contains a function `func1` that calls another local function `func2`. `Func2`, in turn, calls an imported function from Module B, which executes `unreachable`. This checks nested calls and handling of control flow back to the original caller in Module A.

 ;; (module
  (import "B" "importedFunc" (func $importedFunc (result i32)))
  (func $func2 (result i32)
    (call $importedFunc)
    (i32.const 1)
  )
  (func $func1 (result i32)
    (call $func2)
  )
  (start $func1)
)
(assert_invalid
  (module
    (import "B" "importedFunc" (func $importedFunc))
    (func $func2 (result i32)
      (call $importedFunc)
      (i32.const 1)
    )
    (func $func1 (result i32)
      (call $func2)
    )
    (start $func1)
  )
  "type mismatch"
)