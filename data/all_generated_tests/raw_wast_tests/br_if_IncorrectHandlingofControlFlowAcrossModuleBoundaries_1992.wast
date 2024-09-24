;; 3. **Test: Inter-module Function Call Chain with `br_if` for Early Exit**    - **Constraint Checked:** Ensure proper stack unwinding when an exported function performing `br_if` returns early to the caller module.    - **Description:** Define a chain of function calls across modules where one function performs a `br_if` for early exit. Verify that the caller correctly resumes execution and the stack is uncorrupted.

 ;; (module
  (func $callee (result i32)
    (block (result i32)
      (i32.const 1)
      (br_if 0 (i32.const 0))
      (i32.const 2)
    )
  )
  (export "callee" (func $callee))
)

(module
  (import "callee_module" "callee" (func $callee (result i32)))
  (func $caller (result i32)
    (call $callee)
  )
  (export "caller" (func $caller))
)

(assert_invalid
  (instantiate
    (module (import "callee_module" "callee" (func $callee (result i32))))
    (import "callee_module" (instance (export "callee" (func $callee))))
  )
  "type mismatch"
)