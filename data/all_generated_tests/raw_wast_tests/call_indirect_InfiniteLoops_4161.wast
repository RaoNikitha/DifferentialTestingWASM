;; Test 10: Use `call_indirect` within a loop, and the function referenced by `call_indirect` uses stack operations to compute the loop's terminating condition. Validate that signature mismatches cause stack underflows, preventing loop termination and causing infinite looping.  ```

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32) (result i32)))
    (table funcref (elem $func1 $func2))
    (func $func1 (param i32)
      (call_indirect (type 1) (i32.const 0))
    )
    (func $func2 (param i32) (result i32)
      (local.get 0)
    )
    (func (param i32)
      (loop (param i32)
        (call_indirect (type 0) (local.get 0))
        (local.set 0 (i32.sub (local.get 0) (i32.const 1)))
        (br_if 0 (local.get 0))
      )
    )
  )
  "type mismatch"
)