;; 6. **Test Description 6**:    - Construct a scenario where `call_indirect` is used within a deeply nested block/function called via `br`, which itself was called via an outer `call_indirect`. Evaluate how each implementation manages complex branching, ensuring `call_indirect` maintains correct call stack and target resolution.

(assert_invalid
  (module
    (type $sig0 (func (param i32) (result i32)))
    (table funcref (elem $outerFunc))
    (func $targetFunc (param i32) (result i32)
      (local $index i32)
      (block $outer
        (br $outer (call_indirect (type $sig0) (i32.const 0)))
      )
      (local.get $index)
    )
    (func $outerFunc (param i32) (result i32)
      (local.get 0)
      (local.set 1)
      (call_indirect (type $sig0) (i32.const 0))
    )
    (start $outerFunc)
  )
  "type mismatch"
)