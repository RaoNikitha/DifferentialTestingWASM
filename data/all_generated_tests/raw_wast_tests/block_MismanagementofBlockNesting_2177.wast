;; 8. **Test Description**:    Implement a test where nested blocks repeatedly consume and produce operands based on their block types, then introduce a `br_if` at the deepest nesting level targeting the outer blocks. This checks if the operand consumption and stack unwinding is consistently managed across different nesting levels.

(assert_invalid
  (module (func $nested-br-if-stack-unwind (result i32)
    (block (result i32)
      (i32.const 1)
      (block (result i32)
        (i32.const 2)
        (block (result i32)
          (br_if 2 (i32.const 1))
        )
        (i32.add)
      )
      (i32.const 3)
    )
  ))
  "type mismatch"
)