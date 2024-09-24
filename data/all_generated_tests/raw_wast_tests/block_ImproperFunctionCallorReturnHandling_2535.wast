;; 6. **Test Incorrectly Typed Call Indirect Table Entry Lookup:**    - Use a `block` that performs `call_indirect` accessing a table index yielding a function with a different signature than implied by the context.    - **Constraint:** Ensures correct typing and error management for indirect call table lookups.

(assert_invalid
  (module 
    (table 1 funcref)
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param f32) (result f32)))
    (elem (i32.const 0) $func1)
    (func $func1 (type $sig1) (i32.const 42))
    (func (block (call_indirect (type $sig2) (i32.const 0) (f32.const 0.0))))
  )
  "type mismatch"
)