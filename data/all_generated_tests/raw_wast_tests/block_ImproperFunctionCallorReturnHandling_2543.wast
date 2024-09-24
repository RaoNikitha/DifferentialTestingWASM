;; 4. **Indirect Call with Mismatched Type in Block:**    - **Test Description:** Design a block where an indirect call is made with an incorrect type signature, causing a type mismatch.    - **Constraint Checked:** Verification of type checking and proper handling of `call_indirect` to prevent incorrect function execution.    - **Relation to Improper Function Handling:** Ensure that type mismatches in indirect calls are properly detected and handled within blocks.

(assert_invalid
  (module
    (type $t (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (type $t) (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func $g
      (block (result i32)
        (i32.const 0)
        (i32.const 0)
        (call_indirect (type $t) (i32.add (i32.const 0) (i32.const 0)) (i64.const 1))
        (drop)
      )
    )
  )
  "type mismatch"
)