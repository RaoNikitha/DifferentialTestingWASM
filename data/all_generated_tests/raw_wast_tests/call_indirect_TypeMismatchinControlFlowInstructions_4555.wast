;; 4. Setup a `call_indirect` instruction to call a function expecting `i32` parameters and returning an `f64`, but provide a stub function that uses `f64` parameters and returns `i32`. Ensure differential behavior is checked when the dynamic type mismatch leads to a trap.

(assert_invalid
  (module
    (type $expected (func (param i32) (result f64)))
    (type $stub (func (param f64) (result i32)))
    (table funcref (elem 0 (ref.func $funcStub)))
    (func $funcStub (type $stub) (param f64) (result i32) (i32.const 42))
    (func (call_indirect (type $expected) (i32.const 0) (i32.const 0)))
  )
  "type mismatch"
)