;; 4. **Test Description:**    Implement a test with `call_indirect` inside multiple `block` levels and invoke a `call_indirect` that dynamically resolves to call another block, checking correct return paths and stack operations.    - **Constraint Checked:** Dynamic call resolution within nested blocks.    - **Mismanagement Relation:** Validates that stack operations and block exits are correctly managed within deeply nested blocks.

(assert_invalid
  (module
    (type $block-sig-1 (func (param i32) (result i32)))
    (type $block-sig-2 (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $inner-func)
    (func $inner-func (type $block-sig-1)
      (i32.add (local.get 0) (i32.const 1))
    )
    (func $test-func
      (block $block-outer
        (block $block-inner
          (call_indirect (type $block-sig-2) (i32.const 0) (i32.const 0) (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)