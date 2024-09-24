;; 8. **Test Description:**    - Implement an imported function featuring `br_table` checking for labels external to its immediate context and testing control flow disruption when called from an exported function. Ensure transitions respect stack constraints.    - **Constraint:** Validates the integrity of branching across broader control flow contexts within different modules.    - **Control Flow Boundary Check:** Ensures stack and control integrity when `br_table` labels reach beyond initial context boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32)))
    (func $test (export "test")
      (block
        (call $external_func (i32.const 0))
        (i32.const 1)
        (br_table 0 1 2 3 4)
      )
    )
  )
  "unknown label"
)