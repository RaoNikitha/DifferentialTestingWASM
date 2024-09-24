;; 2. **Test 2:** Design a `br_table` with multiple valid targets but provide an index exceeding the number of targets. Place an `unreachable` instruction to trap early and check if `unreachable` is honored before the index check.

(assert_invalid
  (module
    (func (export "test")
      (block $default)
      (block $case1)
      (block $case2)
      (i32.const 3)
      (br_table $case1 $case2 $default
        (unreachable)))))
  "type mismatch"
)