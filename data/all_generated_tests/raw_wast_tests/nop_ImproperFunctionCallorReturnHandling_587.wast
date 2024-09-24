;; 8. Test a function that calls another function, incorporates `nop` instructions after the call and before the `return`, ensuring that the result from the callee function passes correctly through the `nop` instruction and returns properly to the caller.

 ;; (module
  (func $callee (result i32)
    i32.const 42
  )
  (func $caller (result i32)
    call $callee
    nop
    return
  )
  (export "caller" (func $caller))
)