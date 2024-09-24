;; 6. **Test Description**: Construct a WebAssembly module where a valid function table is referenced by multiple `call_indirect` instructions with both valid and invalid indices in different control flow branches. Ensure that the invalid indices trigger traps correctly and branch to the appropriate error handling mechanism.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $func1 (param i32) (result i32) (i32.const 42))
    (table funcref (elem $func1))
    (func $test
      (local i32)
      i32.const 0
      local.set 0
      local.get 0
      call_indirect (type $sig)
      (local.get 0)
      if
        i32.const 1
        call_indirect (type $sig)
      end
      unreachable
    )
  )
  "type mismatch"
)