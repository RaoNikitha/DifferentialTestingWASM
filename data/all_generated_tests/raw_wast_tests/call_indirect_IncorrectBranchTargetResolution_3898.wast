;; 7. **Test Description:**     Employ a `call_indirect` where the target function contains a `block` with an internal branch (`br`). Test the branch jumping out of this block within a multi-level nested structure. Misaddressing the block will indicate an error in target resolution.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func))
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func $nested-blocks (type 0) (param i32) (result i32)
      (block (result i32)
        (block
          (br 1 (i32.const 42))
        )
        (i32.const 0)
      )
    )
    (func (type 1)
      (call_indirect (type 0) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)