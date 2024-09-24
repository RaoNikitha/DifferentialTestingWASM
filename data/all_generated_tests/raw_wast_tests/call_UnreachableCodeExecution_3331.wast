;; 10. **Test Description**:     - **Setup**: Design nested conditionals with multiple indirect calls leading to an `unreachable` instruction based on failed conditions.    - **Constraint**: Verify control path execution correctness for nested conditionals.    - **Reasoning**: Checks the consistency of conditional evaluation paths ending in unreachable.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $nested-conditional (param i32 i32) (result i32)
      local.get 0
      if (result i32)
        local.get 1
        if (result i32)
          call_indirect (type 0) (i32.const 0) (i32.const 0)
        else
          unreachable
        end
      else
        unreachable
      end
    )
  )
  "type mismatch"
)