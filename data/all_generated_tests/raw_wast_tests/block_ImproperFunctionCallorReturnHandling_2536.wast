;; 7. **Test Recursive Function Call Type Error in Block:**    - Create a `block` with recursive function calls where the return type does not match the declared `blocktype`.    - **Constraint:** Examines the handling and error reporting of recursive call types inside blocks.

(assert_invalid
  (module (func $type-recursive-call-block (result i32)
    (block (result i32)
      (call 0)
      (i32.const 1)
    )
  ))
  "type mismatch"
)