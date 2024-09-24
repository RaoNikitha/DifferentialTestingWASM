;; Test 6: - Develop a sequence of `block`, `loop`, `if`, and another `block` wherein `br_if` targets the first `block` from within `if` within the loop. Verify both implementations handle such conditional branching correctly. - **Constraint Checked**: Complex Control Flow and Label Lookup. - **Relation to Incorrect Branch Target Resolution**: Complex mixed structure testing correct label target resolution.

(assert_invalid
  (module 
    (func $complex-control-flow
      (block $outer
        (loop
          (if (i32.const 1)
            (block 
              (br_if 0 (i32.const 1))
            )
          )
        )
      )
    )
  )
  "unknown label"
)