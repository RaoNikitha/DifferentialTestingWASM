;; 8. **Control Flow Violation**:    - Description: Create a control flow where the `br_table` attempts to branch into deeper nested blocks improperly, with an `unreachable` fallback.    - Constraint: Verifies adherence to structured control flow rules.    - Relation: Deviation leads directly to `unreachable` if constraints are misunderstood, reflecting inordinately trapped execution flow.

(assert_invalid
  (module
    (func $control_flow_violation
      (block
        (block
          (br_table 0 1 (i32.const 1))
        )
      )
    )
  )
  "control flow violation"
)