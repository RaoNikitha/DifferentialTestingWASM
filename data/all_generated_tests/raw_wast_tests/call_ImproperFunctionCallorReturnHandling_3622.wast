;; 1. Create a module with a function that requires two integer parameters and returns one integer. Call this function with three integers on the stack. Check if WebAssembly and wizard_engine trap or handle the call differently.

(assert_invalid
  (module
    (func $type-two-params-vs-three-args (call 1 (i32.const 1) (i32.const 2) (i32.const 3)))
    (func (param i32 i32) (result i32) (i32.add (local.get 0) (local.get 1)))
  )
  "type mismatch"
)