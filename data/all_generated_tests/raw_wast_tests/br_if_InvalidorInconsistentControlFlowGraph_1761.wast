;; 2. **Test Description**: Inside a `block`, use `br_if` to conditionally break out to an outer `block`. The `br_if` should supply arguments matching the block’s results. Test for correct stack alignment after branching.    - **Constraint Checked**: Operand stack alignment in block targets.    - **CFG Relation**: Validates that the CFG correctly unwinds and matches stack states for branches targeting blocks.

(assert_invalid
  (module
    (func $conditional_branch (block (block (i32.const 1) (br_if 1 (i32.const 1)))))
  )
  "type mismatch"
)