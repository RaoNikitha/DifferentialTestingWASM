;; 2. Validate a scenario where a `nop` is placed immediately before a `call_indirect` instruction that dynamically selects and calls a function from an imported table. The test should confirm the `call_indirect` targets the expected function and returns the correct result, verifying no context alteration by the `nop`.

(assert_invalid 
  (module 
    (type $t0 (func))
    (table funcref (elem (i32.const 0) $f1)) 
    (func $f1 (result i32) (i32.const 42))
    (func $type-i32 (param i32) (result i32) (nop) (call_indirect (type $t0) (local.get 0))) 
  ) 
  "type mismatch"
)