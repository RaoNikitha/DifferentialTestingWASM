;; 4. Develop a module with a `block` that branches out of nested calls to imported functions with their own `block` instructions and exports a complex call graph. Confirm if context and stack states are preserved.

(assert_invalid
  (module 
    (func $imported1 (import "env" "func1") (param i32))
    (func $imported2 (import "env" "func2") (result i32))
    (func $complex-call-graph (result i32)
      (block (result i32)
        (call $imported1 (i32.const 10))
        (block (result i32)
          (call $imported2)
          (br 1 (i32.const 20))
        )
        (i32.const 30)
      )
    )
  )
  "type mismatch"
)