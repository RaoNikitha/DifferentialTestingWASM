;; 2. **Test Description**: Create a function that returns after executing several `nop` instructions followed by a `call_indirect`. Verify if the `call_indirect` correctly resolves and does not interfere with the return instruction.    - **Constraint Checked**: Validates `call_indirect` resolution isn't affected.    - **Relation to Improper Handling**: If `nop` interferes, `call_indirect` may jump to an incorrect function.

(assert_invalid
  (module
    (type $t (func))
    (table anyfunc (elem $f))
    (func $f (nop) (nop) (call_indirect (type $t)))
    (export "test" (func $f))
  )
  "type mismatch"
)