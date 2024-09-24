;; 8. **Test Description 8**:    - Create a WebAssembly module with `call_indirect` calls interspersed with loop exit branches (`br_if` and `br_unless`) to test if these branches correctly resolve the loop labels, thus ensuring `call_indirect` falls within or outside the loop as intended, with any differences triggering traps or unexpected results.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $loop-test (param i32) (result i32)
      (local i32)
      (block $outer
        (loop $inner
          local.get 0
          i32.const 1
          i32.sub
          tee_local 1
          br_if $inner
          call_indirect (type 0)
            (i32.const 0) local.get 1
        )
      )
      local.get 1
    )
  )
  "type mismatch"
)