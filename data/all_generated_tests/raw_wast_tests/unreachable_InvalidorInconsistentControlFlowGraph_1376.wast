;; 7. **Test Unreachable as Last Instruction in Block:**    - Include `unreachable` as the final instruction in a block. Ensure execution behaves correctly up to this final instruction, trapping as expected and not spilling into subsequent instructions.    - **Constraint Checked:** Correct end-of-block trapping with `unreachable`.    - **CFG Relation:** Incorrect CFG handling might ignore trapping, resulting in unexpected continuation of control flow.

(assert_invalid
  (module (func $unreachable_as_last_instruction_in_block
    (block (i32.const 10) (unreachable) (i32.const 20))
  ))
  "type mismatch"
)