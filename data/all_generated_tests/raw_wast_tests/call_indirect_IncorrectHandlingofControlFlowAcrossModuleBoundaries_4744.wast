;; 3. **Test Description:**    - Import a diverse set of functions (differing parameters/return types) from multiple modules. Use `call_indirect` to invoke one of these imported functions with an incorrect type signature, checking for traps due to dynamic type mismatch.    - **Constraint:** Validate dynamic type checking across module boundaries.    - **Context:** Ensures type mismatches are trapped correctly when calling imported functions with `call_indirect`.    -

(assert_invalid
  (module
    (import "mod1" "func1" (func $func1 (param i32) (result i32)))
    (import "mod2" "func2" (func $func2 (param i64) (result i64)))
    (import "mod3" "func3" (func $func3 (param f32) (result f32)))
    (import "mod4" "func4" (func $func4 (param i32 i32) (result i32)))
    (table funcref (elem $func1 $func2 $func3 $func4))
    (type $t0 (func (param i32) (result i32)))
    (func
      (call_indirect (type $t0) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)