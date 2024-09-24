;; 7. **Test Description:** Create a `loop` structure where each iteration includes a `call_indirect` to varying function tables and a `br` targeting the loop’s start. Check if the indirect calls and loop integrity persist correctly.

(assert_invalid
 (module
  (table funcref (elem 1 2))
  (type $t (func))
  (func $f1 (type $t))
  (func $f2 (type $t))
  (func (result i32)
    (loop (result i32)
      (call_indirect (type $t) (i32.const 0))
      (br 0)
    )
  )
 )
 "type mismatch"
)