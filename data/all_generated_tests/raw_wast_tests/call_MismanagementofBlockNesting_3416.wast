;; 5. **Multiple Function Calls within Nested Loops**:    - **Description**: Insert multiple calls to different functions within a deeply nested loop structure and vary the function signatures.    - **Constraint**: Each loop level changes context, checking that nested calls validate types and indices correctly at each level.    - **Relation to Mismanagement of Block Nesting**: Ensures that repeating function calls in complex control flows don’t mismanage stack frames or function indices.

(assert_invalid
  (module
    (type $t0 (func (param i32) (result i32)))
    (type $t1 (func (param i64) (result i64)))
    (func $f1 (param i32) (result i32)
      (call $f2 (i32.const 5)))
    (func $f2 (param i64) (result i64)
      (i64.const 10))
    (func $nested-loops
      (local i32)
      loop $outer
        loop $inner
          call $f1
          call $f2
          (local.set 0 (i32.add (local.get 0) (i32.const 1)))
          br_if $inner (i32.lt_s (local.get 0) (i32.const 10))
        end
        br_if $outer (i32.lt_s (local.get 0) (i32.const 20))
      end
    )
  )
  "type mismatch"
)