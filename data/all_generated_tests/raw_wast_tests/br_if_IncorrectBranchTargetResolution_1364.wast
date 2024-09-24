;; Test 5: - Create a `loop` that contains another `loop`. Use `br_if` targeting label `1` inside the inner loop, intending to jump to the outer loop. Validate if wizard_engine correctly handles backward jump (continue-like behavior). - **Constraint Checked**: Correct Scope and Label Reference. - **Relation to Incorrect Branch Target Resolution**: Checks if label reference properly targets the outer loop.

(assert_invalid
  (module
    (func (loop (loop (br_if 1 (i32.const 1)))))
  )
  "type mismatch or label reference"
)