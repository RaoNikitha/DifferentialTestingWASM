;; 2. **Exported Function Returning Complex Data**:    - Create a function in one module that returns a complex data structure (e.g., tuples or structs) and import it in another module. Validate the returned data structure is correctly received and used by the calling module.

(assert_invalid
  (module
    (func $complex-return (result i32 i32)
      (local i32 i32)
      (local.set 0 (i32.const 42))
      (local.set 1 (i32.const 100))
      (return (local.get 0) (local.get 1))
    )
    (func $call-complex-return (result i32 i32)
      (call $complex-return) (return)
    )
  )
  "type mismatch"
)