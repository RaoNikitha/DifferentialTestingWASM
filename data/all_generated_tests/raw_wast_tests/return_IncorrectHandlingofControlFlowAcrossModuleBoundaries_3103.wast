;; 2. **Test Description**: Call an exported function that performs several nested calls to imported functions and includes `return` instructions within each nested call. Check the stack consistency after each return.

(assert_invalid
  (module
    (import "js" "func" (func $imported (result i32)))
    (func $nested_return_test (result i32)
      (call $imported)
      (block (call $imported) (return))
    )
    (export "nested_return_test" (func $nested_return_test))
  )
  "type mismatch"
)