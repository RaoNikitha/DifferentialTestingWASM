;; 9. **Test Description**: Create a scenario where a `call_indirect` takes an index based on dynamic runtime computation, within a repeated loop iteration. Incorrect implementation of call indirect that doesn't trap or validate could lead to non-termination of the loop due to incorrect function table accesses.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref (elem 0))
    (func (result i32)
      (local $index i32)
      (local.set $index (i32.const 3))
      loop $loop
        (call_indirect (type 0) (local.get $index) (i32.const 1))
        (br $loop)
      end
    )
  )
  "index out of bounds"
)