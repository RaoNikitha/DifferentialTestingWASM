;; 9. **Test Description:**    A sequence of nested blocks, some containing `br`, others containing `unreachable`, intermixed with regular instructions, concluding with a `return`.    - **Constraint Checked:** Ensures that `unreachable` halts all ensuing instructions including those in blocks not directly containing it, such as `br` or `return`.    - **Relation to Mismanagement of Block Nesting:** Validates the robustness of trap propagation across split nested constructs, confirming depth-aware exit protocols.

(assert_invalid
  (module
    (func (block (block (unreachable) (return)) (br 1)) (i32.const 1))
  )
  "type mismatch"
)