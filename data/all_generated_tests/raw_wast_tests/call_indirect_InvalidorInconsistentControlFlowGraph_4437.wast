;; Provide a scenario involving indirect calls within a switch-case structure, where each case includes different levels of nested indirect calls. This will challenge the control flow accuracy across different branching mechanisms.

(assert_invalid
  (module
    (type $t1 (func (param i32) (result i32)))
    (type $t2 (func (param i32)))
    (table 2 funcref)
    (elem (i32.const 0) $f1 $f2)
    (func $f1 (type $t1) (param i32) (result i32)
      (local.get 0)
    )
    (func $f2 (type $t2) (param i32)
      (call_indirect (type 0) (local.get 0) (i32.const 0))
    )
    (func $f3 (param i32) (result i32)
      (block $block1
        (block $block2
          (br_table $block2 $block1 (local.get 0))
        )
      )
    )
    (func $test
      (call_indirect (type 1) (i32.const 1) (i32.const 0))
    )
  )
  "function type mismatch"
)