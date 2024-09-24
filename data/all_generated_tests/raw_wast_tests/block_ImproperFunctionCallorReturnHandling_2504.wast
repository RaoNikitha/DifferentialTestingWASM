;; 5. Test Description: Create a block that calls a function conditionally using `br_if` followed by a `return` within the block. The function type should slightly differ from the block’s expected type. WebAssembly should detect the mismatch immediately, while `wizard_engine` might mishandle the conditional call and stack.

(assert_invalid
  (module (func $conditional-call-mismatch (result i32)
    (block (result i32)
      (br_if 0 (i32.const 0))
      (return)
    )
    (call 0)
  ))
  "type mismatch"
)