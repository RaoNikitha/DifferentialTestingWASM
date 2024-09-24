;; 5. **Multiple Branch Operations within Block**:    - Create a complex block that contains multiple branching instructions (`br`, `br_if`) within the block that call imported functions. This tests the correct unwinding of the operand stack and control flow management when crossing module boundaries.

(assert_invalid
  (module
    (type $t (func (param i32 i32) (result i32)))
    (import "env" "external_func" (func $external_func (type $t)))
    (func $multiple_branch_instructions (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (i32.const 42)
          (br_if 0 (i32.eqz (local.get 0)))
          (call $external_func (i32.const 1) (i32.const 2))
        )
        (i32.const 21)
        (br 0)
      )
    )
  )
  "type mismatch"
)