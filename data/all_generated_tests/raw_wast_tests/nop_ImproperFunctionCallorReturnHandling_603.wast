;; 4. **Test 4**: Place `nop` before and after a `call_indirect` instruction that calls functions based on runtime-provided indices. Verify that the correct function is called and ensure there’s no change in control flow due to `nop`.

(assert_invalid
  (module
    (type $t (func))
    (table anyfunc (elem $f1 $f2))
    (func $f1 (nop) (i32.const 0) (call_indirect $t))
    (func $f2)
  )
  "type mismatch"
)