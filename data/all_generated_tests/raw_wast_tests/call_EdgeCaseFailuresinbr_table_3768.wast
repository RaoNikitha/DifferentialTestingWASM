;; 7. **Test Description**: Create a scenario where a deep `call` stack results in recursive calls, followed by a complex `br_table`. Use indices that vary to their limits. The intent is to see how both engines handle deep recursion followed by dynamic branching.    - **Reasoning**: Challenges recursive call depth management and branching validity under different implementations.

(assert_invalid
  (module
    (type $deep-rec-func (func))
    (func $rec-call (result i32)
      (call $test)
      (i32.const 0)
    )
    (table 10 funcref)
    (elem (i32.const 0) $rec-call $rec-call $rec-call $rec-call $rec-call $rec-call $rec-call $rec-call $rec-call $rec-call)
    (func $test (call_indirect (type $deep-rec-func) (i32.const 0)))
    (export "test" (func $test))
    (func $start (call $test))
    (start $start)
  )
  "indirect call type mismatch"
)