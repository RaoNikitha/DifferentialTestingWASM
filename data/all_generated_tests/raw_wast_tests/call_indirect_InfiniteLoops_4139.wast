;; 8. **Test 8**:    - Create a test with `call_indirect` to recursively invoke functions containing nested loops, with `br_if` conditions that never evaluate to true, causing deep nested infinite loops.    - **Constraint Checked**: Ensures recursive indirect calls handle control flow and looping correctly to prevent stack overflow and infinite loops.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $loop (param i32) (result i32)
      local.get 0
      i32.const 0
      i32.eq
      br_if 1
      local.get 0
      i32.const 1
      i32.sub
      call_indirect (type $sig) (i32.const 0)
      loop (result i32)
        call_indirect (type $sig) (i32.const 0)
      end
    )
    (table funcref (elem $loop))
    (func $type-nested-loop
      i32.const 10
      call_indirect (type $sig) (i32.const 0)
    )
  )
  "type mismatch"
)