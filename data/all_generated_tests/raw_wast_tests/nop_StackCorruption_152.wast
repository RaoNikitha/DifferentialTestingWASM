;; Test 3: Use a series of `nop` instructions within a function that ends with `call` to another function. Validate that the `nop` instructions do not modify the function call's argument and return value management.

(assert_invalid
  (module
    (func $callee (param i32) (result i32)
      local.get 0)
    (func $caller (param i32) (result i32)
      nop
      nop
      local.get 0
      call $callee))
  "type mismatch"
)