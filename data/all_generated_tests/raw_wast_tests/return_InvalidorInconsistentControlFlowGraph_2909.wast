;; 8. Construct a scenario with multiple nested functions where the inner function’s `return` affects the outer function’s stack, focusing on WebAssembly’s stack type validation against the Wizard Engine’s treatment of intermediate stacks upon encountering `return`.

(assert_invalid
(module
  (func $inner (result i32)
    (i32.const 42) (return)
  )
  (func $outer (result i32)
    (call $inner) (i32.const 0)
  )
)
"type mismatch"
)