;; 8. **Call from Different Contexts**: Define and call functions with indirect `call_indirect` from different contexts (e.g., different global states) ensuring function calls are properly resolved.    - **Constraint**: Contextual resolution of functions.    - **CFG Relation**: Checks multiple CFG branching scenarios based on different initial contexts.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32) (result i32 i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f1)
    (func $f1 (type $sig1) (param i32) (result i32) (local.get 0))
    (func $call (result i32 i32)
      (call_indirect (type $sig2) (i32.const 0) (i32.const 42))
    )
  )
  "type mismatch"
)