;; 1. Test a function that contains a `nop` instruction followed by a `call` to another function that performs a simple addition. The test will check if the `call` returns the correct sum, ensuring the `nop` does not interfere with the function call and return handling.

 ;; (module
  (func $add (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.add)
  (func (param i32 i32) (result i32)
    nop
    local.get 0
    local.get 1
    call $add)
  (export "test" (func 1)))

(assert_return (invoke "test" (i32.const 5) (i32.const 7)) (i32.const 12))