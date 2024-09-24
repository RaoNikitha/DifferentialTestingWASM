;; 9. **Test Description**: Initialize a function that takes an `i32` input and returns `i32`, but place a `call_indirect` in its body to a function requiring an `f32` input, ensuring the indirect call happens during control flow path divergence.    - **Constraint**: Confirm traps on type mismatches in parameters during control flow divergence.    - **Relation**: Testing parameter type mismatches during diverse control flow.

(assert_invalid
  (module
    (type $func_i32_to_i32 (func (param i32) (result i32)))
    (type $func_f32_to_f32 (func (param f32) (result f32)))
    (func $target (type $func_f32_to_f32) (param f32) (result f32) (f32.const 0))
    (table funcref (elem $target))
    (func $caller (type $func_i32_to_i32) (param i32) (result i32)
      (if (i32.eqz (local.get 0))
        (then (call_indirect (type $func_f32_to_f32) (i32.const 0)))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)