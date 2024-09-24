;; 6. **Test Description**: Call a function using `call_indirect` in a scope where the expected return type is `v128`, but the function to be called returns `i32`. Ensure the indirect call happens within conditional constructs.    - **Constraint**: Ensures correct function signature compliance within conditional branches.    - **Relation**: Type mismatch handling within conditional control flow structures.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (type $v128_sig (func (result v128)))
    (table funcref (elem $f))
    (func $f (result i32) (i32.const 42))
    (func (result v128)
      (if (i32.const 1)
        (then (call_indirect (type $v128_sig) (i32.const 0)))
      )
    )
  )
  "type mismatch"
)