;; 4. **Test 4: Incorrect `call_indirect` Targeting**: Invoke `call_indirect` within a context that includes a `br_if` to a higher stack depth. An improper branch taken due to incorrect type-checking or table lookup might expose incorrect depth validation, particularly in `wizard_engine`.

(assert_invalid
  (module
    (type $t (func))
    (table 1 anyfunc)
    (elem (i32.const 0) $dummy)
    (func $dummy)
    (func $test
      (block
        (br_if 1 (i32.const 1)))) ;; Unbound label 1
    (func (call_indirect (type $t) (i32.const 0))))
  "unknown label"
)