;; 10. **Test 10: Mixed Type Operations within a Loop**     - Description: Perform mixed-type operations (e.g., an addition of i32 and f32) within a loop, where the loop block type expects homogeneous types (e.g., only i32).     - Reasoning: This validates that type checks correctly enforce homogeneous types in operations within loops and that mixed-type operations raise appropriate errors.  By examining these scenarios, the goal is to identify discrepancies in how strictly types are validated and enforced within loop constructs in different WebAssembly implementations.

(assert_invalid
  (module (func $mixed-type-ops-in-loop
    (loop (result i32 f32) (i32.const 1) (f32.const 1.0) (i32.add))
  ))
  "type mismatch"
)