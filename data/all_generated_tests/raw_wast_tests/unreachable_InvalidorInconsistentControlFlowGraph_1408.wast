;; 9. **Test 9:** A function using call_indirect with an expected but missing function type signature followed by an `unreachable` instruction to verify that the call does not bypass the trap. ```wat (table funcref (elem)) (function (result i32)   (call_indirect (type 0) (i32.const 0))   unreachable   (i32.const 90) ) ```

(assert_invalid
  (module
    (table 1 funcref) 
    (type (func (result i32)))
    (func (result i32)
      (call_indirect (type 0) (i32.const 0))
      unreachable
      (i32.const 90)
    )
  )
  "type mismatch"
)