;; 8. **Test Description**: Create nested blocks where the outer block has `typeidx`. Use `br_if` in inner blocks checking conditions derived from combined inputs.    - **Constraint Checked**: Validates multi-level condition evaluations across nested blocks with type indices.    - **Relation to Condition Evaluation**: Incorrect type handling or condition checks might lead to wrong branching.

(assert_invalid
  (module
    (type $t (func (param i32 i32)))
    (func $typeidx-nested-blocks
      (block (type $t)
        (block (type $t)
          (br_if 0 (i32.const 1))
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)