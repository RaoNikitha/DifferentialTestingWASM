;; 1. **Test the Proper Handling of Type Mismatches**:    Define a module where the `call_indirect` operation intentionally calls a function with a non-matching type index. Ensure execution reaches an `unreachable` instruction if the function type does not match. This tests if the implementation correctly traps and avoids calling a mismatched function type.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (type 0) (param i32) (result i32) (local.get 0))
    (func (call_indirect (type 1) (i32.const 0) (i32.const 42)))
  )
  "type mismatch"
)