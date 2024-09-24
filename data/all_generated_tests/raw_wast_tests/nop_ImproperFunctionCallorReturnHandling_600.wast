;; 1. **Test 1**: Place a `nop` instruction before a `call` instruction. Validate that the function call and return process is unaffected, guaranteeing that `nop` does not disrupt the function call sequence.

 ;; (module
  (func $foo (result i32) (i32.const 42))
  (func (nop) (call $foo) (drop))
  (export "test" (func 1))
)