;; 7. **Immediate Encoding Error with Complex Imports**:    - Test Description: Use a `br_table` instruction with a misencoded immediate `vec(labelidx)` involving multiple imported functions. Ensure that incorrect immediate handling causes detectable branching errors during cross-module calls.    - Constraint: Tests the robustness of immediate parameter encoding during function transitions across module boundaries.    - Differential Reasoning: Differences in handling immediate parameters might cause branching errors in `wizard_engine`.

(assert_invalid
  (module
    (import "env" "foo" (func $foo (param i32)))
    (import "env" "bar" (func $bar (param i32)))
    (func $test
      (block
        (block
          (block
            (call $foo (i32.const 1))
            (call $bar (i32.const 2))
            (br_table 1 0 0 (i32.const 2))
          )
        )
      )
    )
  )
  "unknown label"
)