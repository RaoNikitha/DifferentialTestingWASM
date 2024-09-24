;; 8. **Test for Mixed Table Insertions and Indirect Calls**:    Import a table and populate it with function references from different modules. Then perform indirect calls using indices that refer to functions of mixed sources. This tests if the implementation correctly handles such mixed cases and maintains proper execution flow and type conformity.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param f32) (result f32)))
    (import "env" "table" (table 2 funcref))
    (func $f1 (param i32) (result i32) (local.get 0))
    (func $f2 (param f32) (result f32) (local.get 0))
    (elem (i32.const 0) $f1 $f2)
    (func
      (call_indirect (type $sig1) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)