;; 10. **Error Handling on Invalid Function Index**:     - **Constraint Checked**: Verifies proper error trapping on invalid function indices.    - **Description**: Import a function table and purposely use an invalid function index in an indirect call from module B to module A's functions. Test if the engines correctly trap the error and verify stack and control flow integrity.

(assert_invalid
  (module
    (import "A" "external_func" (func $imp (param i32)))
    (func $invalid-call (call 10 (i32.const 42)))
  )
  "unknown function index"
)