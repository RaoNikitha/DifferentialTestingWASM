;; 4. **Test Description:** A function makes a `call_indirect` within a block, and this indirectly called function includes a `br` target that jumps out of the original block.    **Constraint Checked:** Validation of correct label lookup and stack unwinding by `br` following an indirect function call.    **Relation to Function Call/Return Handling:** Tests for side effects in unwinding and returning properly when indirect calls are involved.

(assert_invalid
  (module
    (type $return_i32 (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $indirect_func)
    (func $caller
      (block
        (call_indirect (type $return_i32) (i32.const 0))
        (drop)
      )
    )
    (func $indirect_func
      (block
        (loop
          (br 2)
        )
      )
    )
  )
  "unknown label"
)