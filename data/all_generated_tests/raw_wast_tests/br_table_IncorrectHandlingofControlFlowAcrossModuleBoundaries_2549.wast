;; 8. **Unexpected Default Branch from Imported Function**:    - Test Description: Call an imported function from a local one and within this local context use `br_table` so that an out-of-bounds index causes a branch to a default target within the imported function's return.    - Constraint: Verifies correct handling of default branches that intersect import returns, ensuring stack and control consistency.    - Differential Reasoning: Misinterpreting default branching after import calls might expose `wizard_engine`'s control flow mishandling.

(assert_invalid
  (module
    (import "env" "get_value" (func $get_value (result i32)))
    (func (result i32)
      (block (result i32)
        (call $get_value)
        (br_table 0 (i32.const 10))
      )
    )
  )
  "type mismatch"
)