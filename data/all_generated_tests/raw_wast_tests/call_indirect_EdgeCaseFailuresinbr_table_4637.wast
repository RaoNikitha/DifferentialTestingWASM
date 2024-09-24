;; 6. **Test for Exhaustive Table Indexing and Reset with `br_table` Paired `call_indirect`**:    - Perform a `br_table` to an exhaustive range of valid indices and immediately reset to initial state, followed by a `call_indirect`. Verifies state reset handling.    - Constraint: Exhaustive table indices and reset.    - Relation: Tests whether implementations cleanly reset and handle `call_indirect` after exhaustive states.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (type $sig_empty (func))
    (table 10 funcref)
    (elem (i32.const 0) $func0 $func1 $func2 $func3 $func4 $func5 $func6 $func7 $func8 $func9)
    (func $func0 (param i32) (result i32) (i32.const 0))
    (func $func1 (param i32) (result i32) (i32.const 1))
    (func $func2 (param i32) (result i32) (i32.const 2))
    (func $func3 (param i32) (result i32) (i32.const 3))
    (func $func4 (param i32) (result i32) (i32.const 4))
    (func $func5 (param i32) (result i32) (i32.const 5))
    (func $func6 (param i32) (result i32) (i32.const 6))
    (func $func7 (param i32) (result i32) (i32.const 7))
    (func $func8 (param i32) (result i32) (i32.const 8))
    (func $func9 (param i32) (result i32) (i32.const 9))
    (func $test
      (block
        (block
          (br_table 0 1 2 3 4 5 6 7 8 9 (i32.const 5))
          (br 1)
        )
        (call_indirect (type $sig_empty) (i32.const 0))
      )
    )
  )
  "type mismatch"
)