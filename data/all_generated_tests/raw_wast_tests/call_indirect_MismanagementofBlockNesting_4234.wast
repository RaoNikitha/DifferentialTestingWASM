;; 3. **Test 3**: Mixed nested blocks and loops:    - Create blocks and loops interlaced together, calling `call_indirect` at various nesting levels.    - Confirm if the implementation handles these mixed structures without exiting the wrong block or loop.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f64) (result f64)))
    (table 1 funcref)
    (elem (i32.const 0) 0 1)
    (func $func0 (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func $func1 (param f64) (result f64) (f64.add (local.get 0) (f64.const 1.0)))
    (func $test
      (block
        (loop
          (block
            (call_indirect (type 0) (i32.const 0) (i32.const 5))
            (br_if 0 (i32.const 1))
          )
          (call_indirect (type 1) (i32.const 1) (f64.const 2.0))
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)