;; 9. **Indirect Calls in Function Pointers within Complex CFG**:    - Use function pointers stored in tables to be called indirectly via `call_indirect`.    - Create scenarios where pointers may refer to non-existent functions or type mismatches.    - Evaluate whether the CFG accurately reflects all possible indirect call paths and properly handles traps for erroneous references.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func))
    (func $f1 (param i32))
    (func $f2)
    (table 2 funcref (elem $f1 $f2))
    (func (call_indirect (type 0) (i32.const 1)))
  )
  "type mismatch"
)