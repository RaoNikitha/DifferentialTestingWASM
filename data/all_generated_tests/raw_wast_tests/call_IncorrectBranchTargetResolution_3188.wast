;; 7. **Test with Global Index Resolution**:    - **Description**: Involve global variables that influence the behavior of `call` instructions.    - **Constraint**: Ensures that globals are correctly accessed and resolve to the right function calls.    - **Relation to Incorrect Branch Target Resolution**: Incorrect resolution might misinterpret or mishandle global states, directing branches incorrectly.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (type (func (result i32)))
    (func (result i32)
      global.get $g
      call 0
    )
  )
  "global used before declaration"
)