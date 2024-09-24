;; 5. **Multiple Nested Control Structures with `nop`:**    - **Description**: Combine multiple nested control structures (blocks, loops, ifs) with `nop` and various `br` targets. Verify the execution flow.    - **Constraint Checked**: Tests `nop` placement within complex nested structures and correct label resolution for all `br` instructions.    - **Relation to Incorrect Branch Target Resolution**: Ensures no incorrect branch targets within nested control structures containing `nop`.

(assert_invalid
  (module
    (func $nested-control (block $lbl1 (loop $lbl2 (if (i32.const 1) (then (nop) (br $lbl1)) (else (nop) (br $lbl2)))) (nop)))
  )
  "invalid block depth"
)