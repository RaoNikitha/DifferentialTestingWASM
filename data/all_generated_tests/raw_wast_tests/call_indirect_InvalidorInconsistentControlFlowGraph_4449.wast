;; 8. **Test Description**:    - Create a WebAssembly module where the `call_indirect` instruction uses an illegally defined `typeidx` that does not conform to any function definition in the type list.    - **Constraint**: Validates conformance checking against type definitions.    - **CFG Relation**: CFG must properly handle routing to a trap for illegal type definitions across all possible control paths.

(assert_invalid
  (module
    (type (func (param i32) (param i32) (result i32)))
    (type (func (param i32) (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (call_indirect (type 1) (i32.const 0) (i32.const 1) (i32.const 2)))
  )
  "type mismatch"
)