;; 9. **Block with return calls**:    - Construct a block containing calls to imported functions that return values, checking for proper result placement on the operand stack.    - Ensure the calling function matches expected stack state after control returns from the imported functions.

(assert_invalid
  (module
    (func $imported (import "env" "imported_func") (result i32))
    (func $type-block-return-call (result i32)
      (block (result i32)
        (call $imported)
        (i32.const 1) 
      )
    )
  )
  "type mismatch"
)