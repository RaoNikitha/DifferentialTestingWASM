;; 9. **Test Description**:     - **Setup**: Define an inline assembly function call with deliberate misalignment causing an `unreachable` instruction.    - **Constraint**: Ensure control-flow jumps handle misalignment correctly.    - **Reasoning**: Differentiates handling of unexpected memory accesses leading to unreachable.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $f (param i32))
    (func (call $f (unreachable) (i32.const 0)))
  )
  "jump to unreachable instruction"
)