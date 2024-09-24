;; 5. **Wrong Function Type Indexed by `typeidx`:**    - Assess the behavior when `call_indirect` uses a `typeidx` that references an incorrect or malformed function type. The test ensures that type mismatch leads to a trap, with focus on confirming that OCaml's and Java's type-checking mechanisms correctly identify and handle the mismatch.

(assert_invalid
  (module
    (type $sig_correct (func (param i32) (result i32)))
    (type $sig_incorrect (func (param i64) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func_correct)
    (func $func_correct (type $sig_correct) (param i32) (result i32) (local.get 0))
    (func (type $sig_correct) (result i32)
      (call_indirect (type $sig_incorrect) (i32.const 0) (i64.const 42))
    )
  )
  "type mismatch"
)