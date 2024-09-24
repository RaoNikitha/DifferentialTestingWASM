;; 6. **Test Description:**    Invoke a function using `call_indirect` which includes a branching instruction (`br`) within a block that should escape to a higher-level block. Ensure the function type aligns precisely, and validate that the higher-level block is correctly identified and jumped to.

(assert_invalid
  (module
    (type (func (result i32)))
    (table 1 funcref
      (elem (i32.const 0) $f))
    (func $f (result i32)
      (block (result i32)
        (block (result i32)
          (br 1 (i32.const 42)))))
    (func (result i32)
      (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)