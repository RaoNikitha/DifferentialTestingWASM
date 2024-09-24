;; 8. **Test: Nop Instruction at Different Logical Points**    - Design two modules where multiple logical operations (arithmetic and logical) follow `nop`. Export these from Module A and test imports in Module B, confirming unchanged stack state and correct results.    - **Constraint Check**: Ensures inserting `nop` among logical operations does not alter their execution correctness.    - **Relation to Differential Handling**: Common operation sequences impacted by `nop` could highlight initialization issues between modules.

(assert_invalid
  (module
    (func (export "test")
      (i32.const 10)
      (i32.const 20)
      (nop)
      (i32.add)
      (i32.const 5)
      (nop)
      (i32.mul)
    )
  )
  "stack mismatch"
)