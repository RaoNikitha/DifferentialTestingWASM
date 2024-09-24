;; 9. **Test Global Variable Reference in Function Calls**:    - Invoke a function that uses both local and global variables, ensuring the globals are correctly referenced and their states are preserved.    - **Constraint**: Proper context management for global variables.    - **Improper Handling**: Global state may become inconsistent.

(assert_invalid
  (module
    (func $f (param i32) (global.set 0 (local.get 0)))
    (global (mut i32) (i32.const 0))
    (func $g (result i32) (global.get 0))
    (func $call-global
      (call $f (i32.const 42))
      (call $g)
    )
    (export "call_global" (func $call-global))
  )
  "type mismatch"
)