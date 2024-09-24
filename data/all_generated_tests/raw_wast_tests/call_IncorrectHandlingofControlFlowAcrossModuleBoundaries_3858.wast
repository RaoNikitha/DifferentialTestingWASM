;; 7. **Invalid Function Index Handling in Imported Calls**:    - **Reasoning**: Examine how invalid function indices are managed when calling imported functions.    - **Description**: Try calling an imported function using an out-of-bounds function index. This should check whether both implementations validate the `funcidx` correctly before attempting to invoke a function across modules.

(assert_invalid
  (module
    (import "env" "func" (func $imported_func))
    (func $invalid-import-call (call 1))
  )
  "unknown function"
)