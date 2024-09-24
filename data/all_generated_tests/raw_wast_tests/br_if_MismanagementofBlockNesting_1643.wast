;; 4. **Test 4: Block Inside a Conditional Branch**    - **Description:** An `if` condition contains a block, and within this block, there is a `br_if` that targets the outermost block.    - **Constraint Checked:** Correct execution flow when branching out of an if statement into a block.    - **Mismanagement Relation:** Verifying that the correct block is branched to and unwound when conditional branches are involved.

(assert_invalid
  (module
    (func $test-br_if-cond-branch-outside-block
      (if (i32.const 1)
        (block (block (br_if 1 (i32.const 1))))
      )
    )
  )
  "unknown label"
)