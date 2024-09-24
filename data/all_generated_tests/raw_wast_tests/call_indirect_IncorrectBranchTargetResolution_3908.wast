;; 7. **Test Case 7**:    - **Description**: Design a module with deeply nested blocks where `call_indirect` is placed and uses a `br_on_exn` instruction to jump to various enclosing depths. The correct function should be called only when the right branch target is hit during the exception.    - **Constraint Checked**: Precise exception handling with nested block branches.    - **Incorrect Branch Target Resolution**: Ensures that `br_on_exn` provides accurate label resolution to prevent inappropriate function calls.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (result i32)))
    (table 0 funcref)
    (func $deep-nested-call
      (try 
        (block (block (block
          (call_indirect (type 0) (i32.const 0) (i32.const 10))  
          (br_on_exn 2 0)
        )))
      )
    )
  )
  "type mismatch"
)