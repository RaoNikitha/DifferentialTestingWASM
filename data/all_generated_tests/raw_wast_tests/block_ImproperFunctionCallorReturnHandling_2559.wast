;; 10. **Indirect Call Return Mismatch**: Inside a block, perform an indirect call to a function expected to return a different type, and verify correct handling of this mismatch.     ```     block $block11 (result i32)       i32.const 0       call_indirect (type $mismatch_typeidx)       drop     end     ```

(assert_invalid
  (module
    (type $mismatch_typeidx (func (result f64)))
    (table funcref (elem 0))
    (func (result i32)
      (block (result i32)
        i32.const 0
        call_indirect (type $mismatch_typeidx)
        drop
      )
    )
  )
  "type mismatch"
)