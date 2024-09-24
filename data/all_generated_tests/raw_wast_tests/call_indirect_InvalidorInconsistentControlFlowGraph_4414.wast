;; 3. **Test Type Mismatch with Inconsistent Traps**:    - Use `call_indirect` to call functions with mismatched type signatures, ensuring the index is dynamically resolved to the wrong type.    - Mix these calls within conditionals that can alter the execution path.    - This tests ensuring resolving type mismatches properly triggers traps, thus validating the CFG correctness when paths have differing types.

(assert_invalid
  (module
    (type $a (func (param i32) (result i32)))
    (type $b (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (type $a) (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $test
      (if (i32.const 1)
        (then
          (call_indirect (type $b) (i32.const 0) (i32.const 42) (i32.const 100))
        )
        (else
          (nop)
        )
      )
    )
  )
  "type mismatch"
)