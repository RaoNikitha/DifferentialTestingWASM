;; 6. **Test Description**: Create a table of functions returning different types of values. Run a loop with `call_indirect` referencing this table, type checking each function call. Verify proper type-matching and output order after all iterations.    **Constraint Checked**: Function type-checking in indirect calls within loops.

(assert_invalid
  (module
    (table 5 funcref)
    (func $f0 (result i32) (i32.const 0))
    (func $f1 (result f32) (f32.const 0.0))
    (func $f2 (result i64) (i64.const 0))
    (func $f3 (result f64) (f64.const 0.0))
    (func $f4 (result i32) (i32.const 1))
    (elem (i32.const 0) $f0 $f1 $f2 $f3 $f4)
    (func $test_loop_call_indirect
      (local i32)
      (i32.const 5)
      (local.set 0)
      (loop (param i32) (result i32)
        (br_if 1 (i32.eqz (local.get 0)))
        (local.get 0)
        (i32.const 1)
        (i32.sub)
        (local.set 0)
        (i32.const 0)
        (local.get 0)
        (call_indirect (type $i32_to_i32) (result i32))
        (drop)
        (local.get 0)
        (br 0)
      )
    )
  )
  "type mismatch"
)