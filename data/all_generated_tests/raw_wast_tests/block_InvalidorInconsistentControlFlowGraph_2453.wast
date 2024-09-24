;; 4. **Test Description**: Design a block with multiple `blocktype` declarations including an invalid blocktype index. The WebAssembly should fail to manage invalid `blocktype` properly, unlike `wizard_engine` with its explicit `resetInit` management.    - **Constraint Checked**: Handling invalid block types.    - **Relation to CFG**: CFG inconsistency due to misinterpreted block types can lead to erroneous execution flows.

(assert_invalid
  (module
    (type $sig (func (param i32) (result f32)))
    (func $invalid-blocktype
      (block 999 local.get 0)
    )
  )
  "invalid blocktype"
)