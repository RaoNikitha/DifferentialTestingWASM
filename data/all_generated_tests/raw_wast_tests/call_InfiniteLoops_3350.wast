;; 9. **Test Description**:    Design a function that calls itself via an indirect function table in a loop. The test should catch constraint violations or improper function type retrieval from the table resulting in infinite recursive loops.

(assert_invalid
  (module
    (type $loopFuncType (func))
    (func $selfCall (loop $l (call_indirect (type $loopFuncType) (i32.const 0) (i32.const 0))))
    (table 1 funcref)
    (elem (i32.const 0) $selfCall)
  )
  "type mismatch"
)