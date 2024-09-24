;; 8. Implement a complex control flow using `br`, `br_if`, and `call` that relies on nested loops and external function calls. Place an invalid function index within the branch conditions. The WebAssembly should detect and halt, while `wizard_engine` may loop infinitely.

(assert_invalid
  (module
    (func $callee (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func (param i32) (result i32)
      (block
        (loop
          (call 0 (i32.const 42))
          (br_if 1 (i32.eqz (call 99)))
        )
      )
    )
  )
  "unknown function"
)