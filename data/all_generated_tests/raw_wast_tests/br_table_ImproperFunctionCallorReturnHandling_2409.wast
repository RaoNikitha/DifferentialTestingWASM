;; 9. **Test 9: Function Calls with Mixed Param Types in BrTable**    - Design a `br_table` where the labels lead to functions that require different parameter types, resulting in a stack configuration mismatch. This aims to verify if the implementation handles such inconsistencies in parameter types and avoids unexpected behaviors.

(assert_invalid
  (module
    (func $f1 (param i32) (result i32) (local.get 0))
    (func $f2 (param f32) (result f32) (local.get 0))
    (func (block (br_table 0 1 (i32.const 0) (call $f1 (i32.const 1)) (call $f2 (f32.const 1.0)))))
  )
  "type mismatch"
)