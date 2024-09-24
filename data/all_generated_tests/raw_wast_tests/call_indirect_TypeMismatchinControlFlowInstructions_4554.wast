;; 3. Implement a WebAssembly function `f3` that has no parameters and returns `i32`, but the `call_indirect` type index (typeidx) expects a function with `i32` parameter. This should result in a type mismatch trap due to dynamic type checking failure.

(assert_invalid
  (module
    (func $f3 (result i32)
      i32.const 42)
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $f3))
    (func
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)