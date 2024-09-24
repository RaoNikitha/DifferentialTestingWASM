;; 8. **Test Description**: Export a function containing a `br_if` instruction from a loop's body. Inside an importing module, call this function in a nested loop structure and verify if stack height is maintained correctly upon conditional branching.    - **Constraint Checked**: Proper handling of nested loops and stack management when branching conditionally with external functions.    - **Relation to Control Flow**: Examines correct treatment of complex nested control flows across module boundaries.

(assert_invalid
 (module
  (import "env" "external_func" (func $external_func (result i32)))
  (func $nested_br_if
   (loop
    (i32.const 1)
    (call $external_func)
    (br_if 1)
   )
   (i32.const 0)
  )
 )
 "type mismatch"
)