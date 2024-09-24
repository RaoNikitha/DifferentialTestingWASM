;; 10. **Test Description**: Construct a sequence with `load` and `store` operations interspersed with `nop`, ensuring memory accesses do not corrupt the stack. Validate that all stack operations correctly reflect only memory interactions, excluding any unintended effects from `nop`.

(assert_invalid
  (module
    (func
      (local $i i32)
      i32.const 1
      nop
      i32.const 2
      i32.store
      nop
      i32.load
      nop
      )
    )
  "type mismatch"
)