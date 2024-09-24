;; 7. **Test Description**:    - Implement a function that includes a `call_indirect` instruction, using a table to indirectly call a function based on runtime conditions.    - Surround this `call_indirect` instruction with branches that change control flow based on global variables or stack values.    - Include nested `block` constructs to further challenge branch target resolution.    - **Constraint Checked**: Ensure that `call_indirect` combined with branching resolves to the correct function and label.    - **Incorrect Branch Target Resolution**: Errors in branch target resolution can misdirect indirect calls leading to calls to wrong or invalid functions.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 1))
    (func $target (param i32) (result i32) (local.get 0))
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $target)
    (func $test
      (i32.const 1)
      (global.get $g)
      (if
        (then
          (block
            (call_indirect (type $sig) (i32.const 123) (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)