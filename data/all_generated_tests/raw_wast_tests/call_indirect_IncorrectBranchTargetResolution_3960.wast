;; 9. **Test Description 9**:    - Implement a scenario where `call_indirect` is nested and called from within branches targeting loop headers and footers (`br` to start and end of loop). Check how `call_indirect` reacts when branches are incorrectly resolved to loop edges, impacting function call orders or stack states across the implementations.

(assert_invalid
 (module
  (type (func (param i32)))
  (type (func (param i32) (result i32)))
  (table funcref (elem (func 0)))
  (func $nested-call-indirect (param i32)
    (loop $L
      (i32.const 1)
      (br_if $L
        (block $B
          (call_indirect (type 1) (i32.const 0))
        )
      )
      (i32.const 2)
      (br $L)
    )
  )
  (func (type 0)
    (call_indirect (type 0) (i32.const 0))
  )
 )
 "type mismatch"
)