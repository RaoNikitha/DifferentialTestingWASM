;; 3. **Test Description**:    - **Scenario**: Create a recursive function where nested calls reduce certain arguments and potentially lead to an `unreachable` instruction.    - **Constraint Checked**: Verify proper handling of arguments during recursive calls.    - **Unreachable Code Execution**: If argument transfer and stack management are mishandled during recursion, control flow might wrongly proceed to an `unreachable` instruction.    - **Expected Differential Behaviour**: wizard_engine should correctly trap during recursive argument handling, while WebAssembly implementation might fail and reach the `unreachable`.

(assert_invalid
  (module
    (func $recurse (param i32) (result i32)
      (local.get 0)
      (i32.const 1)
      (i32.sub)
      (local.tee 0)
      (br_if 0 (i32.ge_s (local.get 0) (i32.const 0)))
      (unreachable)
    )
    (func (local i32)
      (i32.const 5)
      (call $recurse)
      drop
    )
  )
  "type mismatch"
)