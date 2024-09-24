;; 2. **Test Description:**    - A loop with nested `unreachable` that leads to a `call_indirect` instruction. The test ensures that the `call_indirect` is not reached, thus bypassing any indirect table lookup.    - **Constraint:** Validates that the loop does not continue after encountering `unreachable`.    - **Improper Function Call or Return Handling:** Checks that indirect calls do not proceed when interrupted by an `unreachable` instruction.

(assert_invalid
  (module
    (func $nestedUnreachable
      (loop
        (unreachable)
        (call_indirect (type 0) (i32.const 0))
      )
    )
    (type (func (result i32)))
  )
  "unreachable should trap before reaching call_indirect"
)