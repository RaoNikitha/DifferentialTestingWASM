;; 5. Design a WebAssembly table containing a function with the expected type `[] -> [i32]`. Use `call_indirect` with `[] -> [i64]` typeidx. The caller expects `i64` but the callee returns `i32`, resulting in a type mismatch and should verify the proper trapping mechanism.

(assert_invalid
  (module
    (type $expectedType (func (result i32)))
    (type $mismatchedType (func (result i64)))
    (func $func (result i32) (i32.const 0))
    (table funcref (elem $func))
    (func $test (result i64)
      (i32.const 0)
      (call_indirect (type $mismatchedType))
    )
  )
  "type mismatch"
)