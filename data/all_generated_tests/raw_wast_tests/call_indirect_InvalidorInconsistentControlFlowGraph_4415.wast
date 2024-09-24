;; 4. **Test Out-of-Bounds Index in Different Branches**:    - Configure `call_indirect` with indices that are out of bounds in some branches of an if-else structure, but valid in others.    - The test focuses on ensuring CFG correctly handles bounds and traps for invalid indices based on different execution paths from conditionals.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) $func1 $func2)
    (func $func1 (result i32) (i32.const 1))
    (func $func2 (result i32) (i32.const 2))
    (func $test (param i32) (result i32)
      (if (result i32)
        (i32.eqz (local.get 0))
        (call_indirect (type 0) (i32.const 2))  ;; out of bounds
        (call_indirect (type 0) (i32.const 1))  ;; valid index
      )
    )
  )
  "out of bounds table access"
)