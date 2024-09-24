;; 3. Implement a WebAssembly test case with loops containing `call_indirect` calls where improper handling of type signature causes the `br` instruction to jump to the wrong loop continuation point, resulting in unexpected loop iterations or skipping.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $callee (param i32) (result i32) (local.get 0))
    (table funcref (elem $callee))
    (func $type-mismatch-loop
      (loop $outer
        (br $outer)
        (call_indirect (type $sig) (i32.const 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)