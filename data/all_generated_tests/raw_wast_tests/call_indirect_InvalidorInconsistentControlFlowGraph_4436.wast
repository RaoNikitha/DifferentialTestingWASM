;; Implement a recursive function that indirectly calls itself. The CFG in this case must properly handle indirect recursion, ensuring no misaligned control flow paths.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $recursive)
    (func $recursive (param i32) (result i32)
      (local.get 0)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)